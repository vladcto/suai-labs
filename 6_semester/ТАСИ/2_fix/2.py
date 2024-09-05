import matplotlib.pyplot as plt
from PIL import Image
import numpy as np
from scipy import fftpack
import copy
import heapq
import math
from math_helpers import *
from encoding_helper import *

Q_MATRIX_Y = np.asarray(
    [
        [16, 11, 10, 16, 24, 40, 51, 61],
        [12, 12, 14, 19, 26, 58, 60, 55],
        [14, 13, 16, 24, 40, 57, 69, 56],
        [14, 17, 22, 29, 51, 87, 80, 62],
        [18, 22, 37, 56, 68, 109, 103, 77],
        [24, 35, 55, 64, 81, 104, 113, 92],
        [49, 64, 78, 87, 103, 121, 120, 101],
        [72, 92, 95, 98, 112, 100, 103, 99]
    ]
)


Q_MATRIX_C = np.asarray(
    [
        [17, 18, 24, 47, 99, 99, 99, 99],
        [18, 21, 26, 66, 99, 99, 99, 99],
        [24, 26, 56, 99, 99, 99, 99, 99],
        [47, 66, 99, 99, 99, 99, 99, 99],
        [99, 99, 99, 99, 99, 99, 99, 99],
        [99, 99, 99, 99, 99, 99, 99, 99],
        [99, 99, 99, 99, 99, 99, 99, 99],
        [99, 99, 99, 99, 99, 99, 99, 99]
    ]
)

Q_MATRIX = [Q_MATRIX_Y, Q_MATRIX_C, Q_MATRIX_C]


image = Image.open(
    '/Users/razrab-ytka/Documents/Projects/suai-labs/6_semester/ТАСИ/2_fix/image.jpg')
width, height = image.size
print("Image Width:", width)
print("Image Height:", height)

image_array = np.array(image)

for i in range(8):
    for j in range(8):
        print(f"{image_array[i, j, 0]}, {image_array[i, j, 1]}, {image_array[i, j, 2]}", sep=', ')
    print()

for i in range(16):
    row = ""
    for j in range(16):
        row += f"({image_array[i, j, 0]:3d},{image_array[i, j, 1]:3d},{image_array[i, j, 2]:3d}) "
    print(row)

print("Image Array Shape:", image_array.shape)

yuv_image = RGB2YUV(image_array)
print(f"YUV Image: {yuv_image.shape}")

blocks = eight_by_eight(yuv_image)
print(f"8x8 Block Division: {blocks.shape}")

layered_blocks = []
for block in blocks:
    layered_blocks.append(DivideLayers(block))
layered_blocks = np.asarray(layered_blocks)
print(f"Layer Division: {layered_blocks.shape}")

Y = []
Cr = []
Cb = []
for i in range(len(layered_blocks)):
    Y.append(layered_blocks[i][0].round())
    CrCb = subsampling(layered_blocks[i][1].round(), layered_blocks[i][2].round())
    Cr.append(CrCb[0])
    Cb.append(CrCb[1])
Y = np.asarray(Y)
Cr = np.asarray(Cr)
Cb = np.asarray(Cb)

print(f"Y: {Y.shape}, Cr: {Cr.shape}, Cb: {Cb.shape}")

Big_Cr = np.concatenate((
    np.concatenate((Cr[0], Cr[1]), axis=1),
    np.concatenate((Cr[2], Cr[3]), axis=1)), axis=0
)
Big_Cb = np.concatenate((
    np.concatenate((Cb[0], Cb[1]), axis=1),
    np.concatenate((Cb[2], Cb[3]), axis=1)), axis=0
)

print(Y[0])
print(Y[1])
print(Y[2])
print(Y[3])
print(Big_Cr)
print(Big_Cb)
print("\n\n")

Y_dct = np.zeros((4, 8, 8))

Cr_dct = np.zeros((8, 8))
Cb_dct = np.zeros((8, 8))

def create_dct_matrix(N):
    dct_matrix = np.zeros((N, N))
    for k in range(N):
        for n in range(N):
            if k == 0:
                dct_matrix[k, n] = np.sqrt(1/N) * np.cos(np.pi * k * (2*n + 1) / (2 * N))
            else:
                dct_matrix[k, n] = np.sqrt(2/N) * np.cos(np.pi * k * (2*n + 1) / (2 * N))
    return dct_matrix


print("DCT matrix")
dc_matrix =  create_dct_matrix(8)

print(dc_matrix)

for i in range(len(Y_dct)):
    Y_dct[i] = fftpack.dct(Y[i])

Cr_dct = fftpack.dct(Big_Cr)
Cb_dct = fftpack.dct(Big_Cb)

print(
    f"Y_dct: {Y_dct.shape}, Cr_dct: {Cr_dct.shape}, Cb_dct: {Cb_dct.shape}")

print(Y_dct[0])
print(Y_dct[1])
print(Y_dct[2])
print(Y_dct[3])
print(Cr_dct)
print(Cb_dct)
print("\n\n")

Y_quantized = []
for i in range(len(Y_dct)):
    if i < len(Q_MATRIX):
        Y_quantized.append(quantizeDCTImage(
            copy.deepcopy(Y_dct[i]), Q_MATRIX[i]))
    else:
        Y_quantized.append(quantizeDCTImage(
            copy.deepcopy(Y_dct[i]), Q_MATRIX[-1]))

Y_quantized = np.asarray(Y_quantized)

Cr_quantized = quantizeDCTImage(Cr_dct, Q_MATRIX_C)
Cb_quantized = quantizeDCTImage(Cb_dct, Q_MATRIX_C)
print("Quantization:", end=" ")
print(Y_quantized.shape, Cr_quantized.shape, Cb_quantized.shape)

print(Y_quantized[0])
print(Y_quantized[1])
print(Y_quantized[2])
print(Y_quantized[3])
print(Cr_quantized)
print(Cb_quantized)
print("\n\n")

Y_array = []
for i in range(len(Y_quantized)):
    Y_array.append(constructZigzagArray(Y_quantized[i]))
    print(f"Zigzag Y #{i}:\n{Y_array[i]}\n")
Cr_array = constructZigzagArray(Cr_quantized)
print(f"Zigzag Cr:\n{Cr_array}\n")
Cb_array = constructZigzagArray(Cb_quantized)
print(f"Zigzag Cb:\n{Cb_array}\n")
Y_rle = []
for i in range(len(Y_array)):
    Y_rle.append(rle(Y_array[i]))
    print(f"Y after RLE №{i}:\n{Y_rle[i]}\n")
Cr_rle = rle(Cr_array)
print(f"Cr after RLE:\n{Cr_rle}\n")
Cb_rle = rle(Cb_array)
print(f"Cb after RLE:\n{Cb_rle}\n")

Y_freqs = []
for y in Y_rle:
    Y_freqs.append(find_rle_freq(y))
    print(f"Fq Y: \n{Y_freqs}\n")

Cr_freqs = find_rle_freq(Cr_rle)
print(f"Fq Cr: \n{Cr_freqs}\n")
Cb_freqs = find_rle_freq(Cb_rle)
print(f"Fq Cb: \n{Cb_freqs}\n")

Y_tree = []
i = 0
for y in Y_freqs:
    Y_tree.append(build_huffman_tree(y))
    print(f"Huffman tree for Y{i}:\n{Y_tree[-1]}")
    i += 1

Cr_tree = build_huffman_tree(Cr_freqs)
print(f"Huffman tree for Cr{i}:\n{Cr_tree}")
Cb_tree = build_huffman_tree(Cb_freqs)
print(f"Huffman tree for Y{i}:\n{Cb_tree}")

Y_codes = []
for y in Y_tree:
    Y_codes.append(generate_huffman_codes(y))
print(f"Codes Y: \n{Y_codes}\n")

Cr_codes = generate_huffman_codes(Cr_tree)
print(f"Codes Cr: \n{Cr_codes}\n")
Cb_codes = generate_huffman_codes(Cb_tree)
print(f"Codes Cb: \n{Cb_codes}\n")

for key, code in Cb_codes.items():
    print(f"{key} = {len(code)}")
print()
for key, code in Cr_codes.items():
    print(f"{key} = {len(code)}")


Y_comp = []
for i in range(len(Y_rle)):
    Y_comp.append(compress_huffman(Y_rle[i], Y_codes[i]))
    print(f"Result for Y{i}: {' '.join(Y_comp[i])}\n")

Cr_comp = compress_huffman(Cr_rle, Cr_codes)
print(f"Result for Cr: {' '.join(Cr_comp)}\n")
Cb_comp = compress_huffman(Cb_rle, Cb_codes)
print(f"Result for Cb: {' '.join(Cb_comp)}\n")

result = find_V_out(Y_rle[0], Y_freqs[0], Y_codes[0]) + \
find_V_out(Y_rle[1], Y_freqs[1], Y_codes[1]) + \
find_V_out(Y_rle[2], Y_freqs[2], Y_codes[2]) + \
find_V_out(Y_rle[3], Y_freqs[3], Y_codes[3]) + \
find_V_out(Cr_rle, Cr_freqs, Cr_codes) + \
find_V_out(Cb_rle, Cb_freqs, Cb_codes)
print(f"Vin = 16*16*3*8 = {16 * 16 * 3 * 8}\nVout = {result / 2}")
print(f"CR = {(16 * 16 * 3 * 8 ) / result *2 }")
