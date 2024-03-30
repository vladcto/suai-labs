import math
import help as calc
from decimal import Decimal, getcontext

getcontext().prec = 50

input_string = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ!"
dict_words = set(input_string)
dict_len = len(dict_words)

intervals = {
    ch: (Decimal(i) / Decimal(dict_len), Decimal(i + 1) / Decimal(dict_len))
    for i, ch in enumerate(dict_words)
}

for key, value in intervals.items():
    print(key, value[0], value[1])


def encode(message):
    left = Decimal(0.0)
    right = Decimal(1.0)
    for ch in message:
        new_right = left + (right - left) * intervals[ch][1]
        new_left = left + (right - left) * intervals[ch][0]
        left = new_left
        right = new_right
    print(left, right)
    return (left + right) / Decimal(2)


def decode(code):
    result = ''
    while True:
        for ch, (start, end) in intervals.items():
            if start <= code < end:
                if ch == '!':
                    return result
                result += ch
                code = (code - start) / (end - start)
                break


print(f"Исходное сообщение: {input_string}")
print(f"Количество бит: {len(input_string) * math.ceil(math.log2(dict_len))}")
code = encode(input_string)
print("Закодированное сообщение:", code)
print(f"Количество бит: {calc.bits(code)}")
decoded_message = decode(code)
print("Декодированное сообщение:", decoded_message)
