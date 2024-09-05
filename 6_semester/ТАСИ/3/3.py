import cv2
import pywt
import numpy as np
from decimal import Decimal, getcontext
from math_helper import *


def shift(ST):
    rgb = cv2.imread('/Users/razrab-ytka/Documents/Projects/suai-labs/6_semester/ТАСИ/2_fix/image.jpg')
    yuv = cv2.cvtColor(rgb, cv2.COLOR_BGR2YUV)

    print("Luminance values (Y) before shift:")
    print(yuv[:, :, 0])

    for x in range(16):
        for y in range(16):
            yuv[x, y, 0] -= 2 ** (ST[0]) - 1

    print("Luminance values (Y) after shift:")
    print(yuv[:, :, 0])

    rgb_shifted = cv2.cvtColor(yuv, cv2.COLOR_YUV2BGR)
    return rgb_shifted


ST = [5, 5, 5]
q = 10
rgb = shift(ST)

yuv = pixel(rgb)
print(yuv)

yuv, a = wavelet(yuv, 16)
yuv, a = wavelet(a, 8, need_print=True)

yuv = quant(yuv, q, 8)

getcontext().prec = 38
bypass(yuv, 8)