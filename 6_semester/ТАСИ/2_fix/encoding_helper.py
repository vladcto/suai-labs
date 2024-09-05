import numpy as np
from scipy import fftpack
import copy
import heapq

def constructZigzagArray(mat):
    N = mat.shape[0]
    lstResult = []
    iPlus = False
    tPlus = True
    t = 0
    j = 1

    while True:
        if tPlus:
            if iPlus:
                for i in range(t + 1):
                    lstResult.append(mat[i, t - i])
            else:
                for i in range(t, -1, -1):
                    lstResult.append(mat[i, t - i])
            t += 1
            iPlus = not iPlus

            if t == N:
                tPlus = not tPlus
        else:
            k = t - 1
            if iPlus:
                for i in range(j, t):
                    lstResult.append(mat[i, k])
                    k -= 1
            else:
                for i in range(j, t):
                    lstResult.append(mat[k, i])
                    k -= 1
            j += 1
            iPlus = not iPlus
            if j > t:
                break
    return np.array(lstResult)

def rle(str):
    result = []
    count = 0

    if len(str) == 1:
        result.append((1, int(str[0])))
        return result

    for i in range(len(str)):
        count += 1
        if (i + 1) == len(str) or str[i] != str[i + 1]:
            result.append((count, int(str[i])))
            count = 0
    return result

def build_huffman_tree(symbols_freq: dict):
    heap = [[weight, [obj, ""]] for obj, weight in symbols_freq.items()]
    heapq.heapify(heap)

    while len(heap) > 1:
        lo = heapq.heappop(heap)
        hi = heapq.heappop(heap)
        for pair in lo[1:]:
            pair[1] = '0' + pair[1]
        for pair in hi[1:]:
            pair[1] = '1' + pair[1]
        heapq.heappush(heap, [lo[0] + hi[0]] + lo[1:] + hi[1:])

    return heap[0]

def find_V_out(elements, freqs, codes):
    result = 0
    for element in elements:
        result += freqs[element] * len(codes[element])
    return result

def find_rle_freq(rle_array: list):
    result = dict()

    for element in rle_array:
        freq = rle_array.count(element)
        if freq not in result:
            result[element] = freq
    return result

def generate_huffman_codes(tree):
    huff_codes = {}
    for pair in tree[1:]:
        symbol, code = pair
        huff_codes[symbol] = code
    return huff_codes

def compress_huffman(data, huff_codes):
    compressed_data = []
    for obj in data:
        compressed_data.append(huff_codes[obj])
    return compressed_data