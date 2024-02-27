import decimal as decimal
from fractions import Fraction
from collections import Counter
import math
import os


def arithmetic_encoding(input, bounds):
    lower, upper = Fraction(0), Fraction(1)

    for char in input:
        length = upper - lower
        lower += length * Fraction(bounds[char][0])
        upper = lower + length * Fraction(bounds[char][1])
        print(f"Interval: {char}", lower, " - ", upper)
    return [lower, upper]


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
    raise ValueError("Increase decimal.getcontext().prec")


input = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ!"
decimal.getcontext().prec = 500
coding = 256

bounds = dict()
chars = sorted(Counter(input).keys())
for i, char in enumerate(chars):
    bounds[char] = (Fraction(i, coding), Fraction(i + 1, coding))
    
intervals = [f"{chars[i]} {float(bounds[chars[i]][0])} - {float(bounds[chars[i]][1])}" for i in range(len(chars))]
for interval in intervals:
    print(interval)

result = arithmetic_encoding(input, bounds)
lower_bound = str(decimal_from_fraction(result[0]))
upper_bound = str(decimal_from_fraction(result[1]))
accuracy = get_accuracy(lower_bound, upper_bound)
prefix = os.path.commonprefix([lower_bound, upper_bound])
print()
print(f'Final interval: {lower_bound}, {upper_bound}')
print(f'Interval cut  : {lower_bound[:accuracy]}, {upper_bound[:accuracy]}')
print(f'Prefix        : {prefix}')
coded_num = decimal.Decimal(prefix[-1:1:-1])
print("Initial data: ", len(input) * math.ceil(math.log2(coding)))
print("Coded data  : ", math.ceil(math.log2(coded_num)))
