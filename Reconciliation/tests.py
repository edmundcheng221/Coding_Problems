import unittest
import reconciliation


class TestSolution(unittest.TestCase):
    # Test the sample output and compare it to the output provided in the question
    def test_get_output_file_for_sample_input(self):
        call = reconciliation.Solution('recon.in')
        answer = call.get_output_file()
        get_output_return_val = answer
        expected_return_val = ['Cash 8000', 'GOOG 10', 'TD -100', 'MSFT 10']
        self.assertTrue(get_output_return_val == expected_return_val)

    def test_init(self):  # Test if the constructor is working
        out = reconciliation.Solution('recon.in').filename
        expect = 'recon.in'
        self.assertTrue(out == expect)

    def test_open_file(self):  # test open file method
        output = reconciliation.Solution('recon.in').open_file()
        # expected is the nested list of the input given
        expected = [['AAPL 100', 'GOOG 200', 'SP500 175.75', 'Cash 1000'], ['AAPL SELL 100 30000', 'GOOG BUY 10 10000',
                'Cash DEPOSIT 0 1000', 'Cash FEE 0 50',
                                                                            'GOOG DIVIDEND 0 50', 'TD BUY 100 10000'],
                    ['GOOG 220', 'SP500 175.75', 'Cash 20000', 'MSFT 10']]
        self.assertEqual(output, expected)

    def test_get_holdings_end_day_0(self):  # test get_holdings_end_day_0 method
        output = reconciliation.Solution('recon.in').get_holdings_end_day_0()
        expected = [['AAPL', '100'], ['GOOG', '200'], ['SP500', '175.75'], ['Cash', '1000']]
        self.assertEqual(output, expected)

    def test_get_dictionary_end_day_0(self):  # test get_dictionary_end_day_0 method
        output = reconciliation.Solution('recon.in').get_dictionary_end_day_0()
        expected = {'AAPL': 100, 'GOOG': 200, 'SP500': 175.75, 'Cash': 1000}
        self.assertDictEqual(output, expected)

    def test_get_day_0_cash(self):  # test get_day_0_cash method
        output = reconciliation.Solution('recon.in').get_day_0_cash()
        expected = 1000
        self.assertTrue(output == expected)

    def test_get_nested_lst_actions(self):  # test get_nested_lst_actions method
        output = reconciliation.Solution('recon.in').get_nested_lst_actions()
        expected = [['AAPL', 'SELL', '100', '30000'], ['GOOG', 'BUY', '10', '10000'], ['Cash', 'DEPOSIT', '0', '1000'],
                    ['Cash', 'FEE', '0', '50'], ['GOOG', 'DIVIDEND', '0', '50'], ['TD', 'BUY', '100', '10000']]
        self.assertEqual(output, expected)

    def test_perform_day_1_actions(self):  # test perform_day_1_actions method
        output = reconciliation.Solution('recon.in').perform_day_1_actions()
        expected_write_output = {'AAPL': 0, 'GOOG': 210, 'Cash': 210, 'TD': 100}
        expected_diction = {'AAPL': 100, 'GOOG': 200, 'SP500': 175.75, 'Cash': 1000}
        expected_money = 12000
        self.assertDictEqual(output[0], expected_write_output)
        self.assertDictEqual(output[1], expected_diction)
        self.assertEqual(output[2], expected_money)

    def test_get_end_of_day_1(self):  # test get_end_of_day_1 method
        output = reconciliation.Solution('recon.in').get_end_of_day_1()
        expected = {'GOOG': 220, 'SP500': 175.75, 'Cash': 20000, 'MSFT': 10}
        self.assertDictEqual(output, expected)

    def test_compute_difference(self):  # test compute_difference method
        output = reconciliation.Solution('recon.in').compute_difference()
        expected_google = 10
        expected_td = -100
        expected_msft = 10
        expected_cash = 8000
        self.assertEqual(output.get('GOOG'), expected_google)
        self.assertEqual(output.get('TD'), expected_td)
        self.assertEqual(output.get('MSFT'), expected_msft)
        self.assertEqual(output.get('Cash'), expected_cash)


if __name__ == '__main__':
    unittest.main()