# Для начала pip install fractions
# Или pip3 install decimal
import decimal as decimal
from fractions import Fraction
from collections import Counter
import os


def arithmetic_encoding(bounds):
    lower, upper = Fraction(0), Fraction(1)

    for char, l, u in bounds:
        range = upper - lower
        upper = lower + range * Fraction(u)
        lower = lower + range * Fraction(l)

        print(f'Character: {char}, Interval: ({lower}, {upper})')

    return [lower, upper]


def create_bound_map(input):
    char_counts = Counter(input)
    total_chars = len(input)

    bound_map = {}
    lower_bound = Fraction(0)

    for char, count in char_counts.items():
        upper_bound = lower_bound + Fraction(count, total_chars)
        bound_map[char] = (lower_bound, upper_bound)
        lower_bound = upper_bound

    return bound_map


def decimal_from_fraction(frac):
    return frac.numerator / decimal.Decimal(frac.denominator)


def get_accuracy(num1, num2):
    length = len(num1)
    match = False
    for i in range(length):
        if num1[i] == num2[i]:
            continue
        if (match):
            return min(length, i+1)
        match = True
    print("Increase decimal.getcontext().prec")

input = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ!"
bound_map = create_bound_map(input)

bounds = [(char, bound_map[char][0], bound_map[char][1]) for char in input]
result = arithmetic_encoding(bounds)
decimal.getcontext().prec = 100
lower_bound = str(decimal_from_fraction(result[0]))
upper_bound = str(decimal_from_fraction(result[1]))
split_i = get_accuracy(lower_bound, upper_bound)
print()
print(f'Final interval: {lower_bound}, {upper_bound}')
print(f'Interval cut  : {lower_bound[:split_i]}, {upper_bound[:split_i]}')
print(f'Prefix        : {os.path.commonprefix([lower_bound, upper_bound])}')
