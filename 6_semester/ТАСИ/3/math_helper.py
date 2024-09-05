import cv2
import pywt
import numpy as np
from decimal import Decimal, getcontext

def pixel(rgb):
    yuv = cv2.cvtColor(rgb, cv2.COLOR_BGR2YUV)

    print('Luminance matrix (Y):')
    print(yuv[:, :, 0])
    print('U matrix:')
    print(yuv[:, :, 1])
    print('V matrix:')
    print(yuv[:, :, 2])
    return yuv

def wavelet(yuv, n, need_print = False):
    wave = np.empty((n, n, 3))

    for i in range(3):
        coeffs = pywt.dwt2(yuv[:, :, i], 'haar')
        a, (h, v, d) = coeffs
        wave[:, :, i] = np.vstack((np.hstack((a, h)), np.hstack((v, d))))

    a = np.empty((int(n / 2), int(n / 2), 3))

    for i in range(3):
        for x in range(int(n / 2)):
            for y in range(int(n / 2)):
                a[x, y, i] = wave[x, y, i]

    np.set_printoptions(precision=2, suppress=True, formatter={'all': lambda x: f'{x:0.2f}'})
    if need_print:
        print('Luminance matrix after wavelet transformation (Y):')
        print(wave[:, :, 0])
        print('U matrix after wavelet transformation:')
        print(wave[:, :, 1])
        print('V matrix after wavelet transformation:')
        print(wave[:, :, 2])

    return wave, a

def quant(yuv, q, n):
    for i in range(3):
        for x in range(n):
            for y in range(n):
                if np.abs(yuv[x, y, i]) < q:
                    yuv[x, y, i] = 0
                else:
                    yuv[x, y, i] = (np.round(yuv[x, y, i] / q))

    print('Luminance matrix after quantization (Y):')
    print(yuv[:, :, 0])
    print('U matrix after quantization:')
    print(yuv[:, :, 1].astype(int))
    print('V matrix after quantization:')
    print(yuv[:, :, 2].astype(int))

    return yuv

def bypass(yuv, n):
    item = ["Luminance matrix (Y):", "U matrix:", "V matrix:"]
    V = 0
    for i in range(3):
        print(item[i])
        for y in range(n):
            l, h, v = arithmetic(yuv[:, y, i])
            V += v
            print(f'l{y} = {l}\nh{y} = {h}\n')
    print(f'Total file size: {V}')

def arithmetic(input_string):
    symbol_freq = {}
    for char in input_string:
        if char in symbol_freq:
            symbol_freq[char] += 1
        else:
            symbol_freq[char] = 1

    v = 0

    interval_start = Decimal(0.0)
    interval_end = Decimal(1.0)
    for char, freq in symbol_freq.items():
        v += -np.log2(freq / len(input_string)) * freq / len(input_string)
        symbol_freq[char] = [interval_start, interval_start + Decimal(freq / len(input_string))]
        interval_start = interval_start + Decimal(freq / len(input_string))
    symbol_freq['EOF'] = [interval_start, interval_end - interval_start]

    low = Decimal(0.0)
    high = Decimal(1.0)
    for char in input_string:
        range_size = Decimal(high - low)
        high = Decimal(low + range_size * symbol_freq[char][1])
        low = Decimal(low + range_size * symbol_freq[char][0])

        print(f'{char}: [{low}, {high}]')
        print(f'{char}: low = {low}, high = {high}')

    return low, high, v
