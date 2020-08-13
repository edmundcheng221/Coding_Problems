roman_string = input('Please input a string representing a roman numeral:')
# # user inputs a roman numeral string


class Equivalent:
    def roman_to_arabic(self, roman_string):
        rom_val = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        arabic_val = 0
        for i in range(len(roman_string)):
            if i > 0 and rom_val[roman_string[i]] > rom_val[roman_string[i - 1]]:
                arabic_val += rom_val[roman_string[i]] - (2 * rom_val[roman_string[i - 1]])
            else:
                arabic_val += rom_val[roman_string[i]]
        return arabic_val

print(Equivalent().roman_to_arabic(roman_string))
