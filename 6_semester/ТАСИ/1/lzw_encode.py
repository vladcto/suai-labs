import string
from math import ceil, log2


def lzw_encode(input_string, dict_symbols):
    code = []
    current_string = input_string[0]
    for next_symbol in input_string[1:]:
        new_string = current_string + next_symbol
        if new_string in dict_symbols:
            current_string = new_string
        else:
            code.append(dict_symbols[current_string])
            dict_symbols[new_string] = len(dict_symbols)
            current_string = next_symbol
    code.append(dict_symbols[current_string])
    print("Результатирующий словарь:")
    for (i , (k, v)) in enumerate(dict_symbols.items(), ):
        if(i < 256):
            continue
        print(k, v)
    return code


def lzw_decode(encoded_sequence, dict_symbols):
    reverse_dict = {value: key for key, value in dict_symbols.items()}
    decoded_string = reverse_dict[encoded_sequence[0]]
    current_string = reverse_dict[encoded_sequence[0]]
    for code in encoded_sequence[1:]:
        if code in reverse_dict:
            next_string = reverse_dict[code]
        else:
            next_string = current_string + current_string[0]
        decoded_string += next_string
        reverse_dict[len(reverse_dict)] = current_string + next_string[0]
        current_string = next_string
    return decoded_string


input_string = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ"
dict = sorted(set("!\"#$%&'()*+,-. /0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяЁё№¤¦¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ╙╘╒╓╫"))
print(dict)
dict_symbols = {symbol: index for index,
                symbol in enumerate(dict)}
    
print(f"Исходное кол-во бит: {len(input_string) * ceil(log2(len(dict)))}")
encoded_sequence = lzw_encode(input_string, dict_symbols)
encoded_length = len(encoded_sequence)
print(f"Количество код. бит: {encoded_length * ceil(log2(max(encoded_sequence)))}")
decoded_string = lzw_decode(encoded_sequence, dict_symbols)
print(decoded_string)
