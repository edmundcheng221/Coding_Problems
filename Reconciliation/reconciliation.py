import argparse


class Solution:
    def __init__(self, filename):  # Constructor
        self.filename = filename

    @staticmethod
    def cli():  # argparse module
        parser = argparse.ArgumentParser(description='Perform Reconciliation')
        parser.add_argument('-f', '--filename', type=str, metavar='', required=True,
                            help='name or path of file to read')
        args = parser.parse_args()
        a = Solution(args.filename)
        a.open_file()

    def open_file(self):  # open file and make list containing contents
        with open(self.filename, 'r') as recon:
            lst = []  # empty list to collect each line of the recon.in file
            for line in recon:  # iterate through each line
                lst.append(line.strip())  # remove leading and trailing white space
            new_lst = []  # list to combine sub-lists
            sub_lst = []  # sub-lists for each category (D0-POS, D1-TRN, D1-POS)
            for el in lst:  # algorithm to create nested lists
                if el != '' and '-' not in el:
                    sub_lst.append(el)  # append elements that are not empty or the first element
                elif el == '':  # split up D0-POS, D1-TRN and D1-POS
                    new_lst.append(sub_lst)
                    sub_lst = []
        return new_lst

    def get_holdings_end_day_0(self):
        new_lst = Solution(self.filename).open_file()
        # (Position at the end of day 0)
        holdings = []
        if len(new_lst) < 1:  # if nothing is there, we pass
            pass
        else:
            for ele in range(len(new_lst[0])):
                holdings.append(new_lst[0][ele])
        arr = []  # list to hold lists of stocks at the end of day 0
        for a in holdings:
            arr.append(a.split(' '))
        return arr  # [['AAPL', '100'], ['GOOG', '200'], ['SP500', '175.75'], ['Cash', '1000']] expected

    def get_dictionary_end_day_0(self):
        arr = Solution(self.filename).get_holdings_end_day_0()
        # NESTED LIST OF POSITIONS AT THE END OF DAY 0
        diction_end_day_0 = {}  # takes into account whether there are duplicates of a stock at the end of day 0
        for array in arr:
            if array[0] in diction_end_day_0:
                diction_end_day_0[array[0]] += float(array[1])
            else:
                diction_end_day_0[array[0]] = float(array[1])
        return diction_end_day_0  # {'AAPL': 100, 'GOOG': 200, 'SP500': 175.75, 'Cash': 1000} expected

    def get_day_0_cash(self):  # amount of money in account at the end of day 0
        diction_end_day_0 = Solution(self.filename).get_dictionary_end_day_0()
        if 'Cash' in diction_end_day_0:  # get the cash
            money = diction_end_day_0.get('Cash')
        else:
            money = 0
        return money  # $1000 expected

    def get_nested_lst_actions(self):
        new_lst = Solution(self.filename).open_file()
        #  day 1 actions
        actions = []
        if len(new_lst) < 1:
            pass
        else:
            for move in range(len(new_lst[1])):
                actions.append(new_lst[1][move])
        nested_day_1_moves = []
        for a3 in actions:
            nested_day_1_moves.append(a3.split(' '))
        # nested_day_1_moves is the nested list of stock, action, number of shares, and price
        # each list within list's first element is the stock name
        return nested_day_1_moves

    def perform_day_1_actions(self):  # get money and shares in account after day 1
        nested_day_1_moves = Solution(self.filename).get_nested_lst_actions()
        diction = Solution(self.filename).get_dictionary_end_day_0()
        money = Solution(self.filename).get_day_0_cash()
        write_output = {}  # collect the recon.out in a dictionary to write into a file later
        for share in range(len(nested_day_1_moves)):  # iterate through the outer list
            if nested_day_1_moves[share][1] == 'SELL':  # operations performed if the stock is sold
                res = diction.get(nested_day_1_moves[share][0], 0)  # get value of stock in diction
                if res is None:  # if stock is not in dictionary, we add it
                    diction[nested_day_1_moves[share][0]] = -1 * float(nested_day_1_moves[share][2])
                    res = diction.get(nested_day_1_moves[share][0], 0)  # collect the value
                    money += float(nested_day_1_moves[share][3])
                else:  # otherwise, we perform the operations on the num of stock and the num of cash
                    res -= float(nested_day_1_moves[share][2])
                    money += float(nested_day_1_moves[share][3])
            elif nested_day_1_moves[share][1] == 'BUY':  # operations performed if stock is bought
                res = diction.get(nested_day_1_moves[share][0], 0)
                if res is None:  # if not in dictionary
                    diction[nested_day_1_moves[share][0]] = float(nested_day_1_moves[share][2])
                    money -= float(nested_day_1_moves[share][3])
                else:
                    res += float(nested_day_1_moves[share][2])
                    money -= float(nested_day_1_moves[share][3])
            # for deposit, fee, and dividend, there is no change in the number of shares
            elif nested_day_1_moves[share][1] == 'DEPOSIT':
                money += float(nested_day_1_moves[share][3])
            elif nested_day_1_moves[share][1] == 'FEE':
                money -= float(nested_day_1_moves[share][3])
            elif nested_day_1_moves[share][1] == 'DIVIDEND':
                money += float(nested_day_1_moves[share][3])
            write_output[nested_day_1_moves[share][0]] = res
        return write_output, diction, money

    def get_end_of_day_1(self):
        # Get Final Alleged Results (Position after day 1) to be compared against
        changes = []
        new_lst = Solution(self.filename).open_file()  # contents in list after reading all files
        if len(new_lst) < 1:  # once again, we need to make sure there are stocks to iterate over
            pass
        else:
            for stock in range(len(new_lst[2])):
                changes.append(new_lst[2][stock])
        capital = []  # make nested list from changes to separate stocks
        for position in changes:
            capital.append(position.split(' '))
        diction_positions = {element[0]: float(''.join(element[1:])) for element in capital}
        # dictionary from nested list
        return diction_positions  # {'GOOG': 220, 'SP500': 175.75, 'Cash': 20000, 'MSFT': 10} expected

    def compute_difference(self):  # difference between the alleged results and my calculations
        return_day_1_actions = Solution(self.filename).perform_day_1_actions()
        write_output = return_day_1_actions[0]
        diction = return_day_1_actions[1]
        money = return_day_1_actions[2]
        diction_positions = Solution(self.filename).get_end_of_day_1()
        # compute differences between the output and what is shown at the end of day 1
        for companies_in_calculations in write_output:  # if the company is not shown in D1-POS
            if companies_in_calculations == 'Cash' or companies_in_calculations in diction_positions:
                pass
            else:
                diction_positions[companies_in_calculations] = 0
        for company_compared_against in diction_positions:
            if company_compared_against == 'Cash':
                pass
            elif company_compared_against in write_output:
                write_output[company_compared_against] = diction_positions.get(company_compared_against) - \
                                                         write_output.get(company_compared_against)
            else:
                write_output[company_compared_against] = diction_positions.get(company_compared_against)
                if diction_positions.get(company_compared_against) == diction.get(company_compared_against):
                    write_output[company_compared_against] = diction_positions.get(company_compared_against) - \
                                                             write_output.get(company_compared_against)
        if 'Cash' in diction_positions:  # get the new amount of cash
            alleged = diction_positions.get('Cash')  # money in account that needs to be check
            difference = alleged - money  # get the difference (how much we are off)
        else:
            difference = 0 - money
        write_output['Cash'] = difference
        return write_output  # what should be shown in output file

    def get_output_file(self):
        with open('recon.out', 'w') as recon_out:
            result = []  # collect output in a list so that I can run tests on it easier
            write_output_reference = Solution(self.filename).compute_difference()
            for output_cash in write_output_reference:  # want cash to be the first element
                if output_cash == 'Cash' and write_output_reference[output_cash] != 0:
                    recon_out.write(output_cash + ' ' + str(int(write_output_reference[output_cash])) + '\n')
                    ans = output_cash + ' ' + str(int(write_output_reference[output_cash]))
                    result.append(ans)
                else:
                    pass
            for output_stocks in write_output_reference:
                if output_stocks == 'Cash':
                    pass
                elif write_output_reference[output_stocks] == 0:
                    pass
                else:
                    recon_out.write(output_stocks + ' ' + str(int(write_output_reference[output_stocks])) + '\n')
                    ans2 = output_stocks + ' ' + str(int(write_output_reference[output_stocks]))
                    result.append(ans2)
        return result  # result excluding stocks with 0 shares (list version of output)


if __name__ == '__main__':
    call = Solution('recon.in')
    answer = call.get_output_file()
    print(call.cli())
    # print(Solution('recon.in').compute_difference())

