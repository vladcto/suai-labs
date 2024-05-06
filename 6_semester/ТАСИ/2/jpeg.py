import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import dct
from huffman import huffman_code


def create_random_image():
    return np.random.randint(0, 256, size=(16, 16, 3))


def rgb_to_ycbcr(image):
    YCbCr_matrix = np.array(
        [
            [0.299, 0.587, 0.114],
            [0.5, -0.4187, -0.0813],
            [0.1687, -0.3313, 0.5]
        ]
    )

    y_image = image @ YCbCr_matrix
    y_image[:, :, 1:] += 128
    return y_image.astype(np.uint8)


def sample(ycbcr_image):
    height, width, _ = ycbcr_image.shape
    blocks = []

    for i in range(0, height, 8):
        for j in range(0, width, 8):
            cb_block = ycbcr_image[i:i+8, j:j+8, 1]
            cr_block = ycbcr_image[i:i+8, j:j+8, 2]

            cb_mean = np.mean(cb_block)
            cr_mean = np.mean(cr_block)

            new_cb_block = np.full_like(cb_block, cb_mean)
            new_cr_block = np.full_like(cr_block, cr_mean)


            new_ycbcr_block = np.dstack(
                (ycbcr_image[i:i+8, j:j+8, 0], new_cb_block, new_cr_block)
            )
            blocks.append(new_ycbcr_block)

    return np.array(blocks)


def dct_encode_blocks(sampled_blocks):
    def dct_encode(sampled_image):
        cb_block = sampled_image[:, :, 1]
        cr_block = sampled_image[:, :, 2]

        cb_dct = dct(cb_block, axis=0)
        cr_dct = dct(cr_block, axis=0)

        sampled_image[:, :, 1] = cb_dct
        sampled_image[:, :, 2] = cr_dct

        return sampled_image

    return [dct_encode(bloc) for bloc in sampled_blocks]


def zigzag_scan_blocs(blocks):
    def zigzag_scan(block):
        # Define the zig-zag scan pattern
        zigzag_pattern = np.array([
            [0,  1,  5,  6, 14, 15, 27, 28],
            [2,  4,  7, 13, 16, 26, 29, 42],
            [3,  8, 12, 17, 25, 30, 41, 43],
            [9, 11, 18, 24, 31, 40, 44, 53],
            [10, 19, 23, 32, 39, 45, 52, 54],
            [20, 22, 33, 38, 46, 51, 55, 60],
            [21, 34, 37, 47, 50, 56, 59, 61],
            [35, 36, 48, 49, 57, 58, 62, 63]
        ])

        # Flatten the block into a 1D array using the zig-zag scan pattern
        block_vector = block.flatten()[zigzag_pattern.flatten()]

        return block_vector
    return np.array([zigzag_scan(block) for block in blocks])

# def quantize(blocks):
#     def quantize(block):
#         # Define the zig-zag scan pattern
#         zigzag_pattern = np.array([
#             [0,  1,  5,  6, 14, 15, 27, 28],
#             [2,  4,  7, 13, 16, 26, 29, 42],
#             [3,  8, 12, 17, 25, 30, 41, 43],
#             [9, 11, 18, 24, 31, 40, 44, 53],
#             [10, 19, 23, 32, 39, 45, 52, 54],
#             [20, 22, 33, 38, 46, 51, 55, 60],
#             [21, 34, 37, 47, 50, 56, 59, 61],
#             [35, 36, 48, 49, 57, 58, 62, 63]
#         ])

#         # Flatten the block into a 1D array using the zig-zag scan pattern
#         block_vector = block.flatten()[zigzag_pattern.flatten()]

#         return block_vector
#     return np.array([zigzag_scan(block) for block in blocks])

def encode_vectors(vectors):
    def run_length_encoding(vector):
        # Create an empty list to store the pairs
        pairs = []

        # Initialize variables for counting zeros and non-zeros
        zero_count = 0
        nonzero_prev = False

        # Iterate over the elements of the vector
        for elem in vector:
            if elem != 0:
                # If the current element is non-zero, add a pair for any preceding zeros
                if zero_count > 0:
                    pairs.append((zero_count, 0))
                    zero_count = 0

                # Add a pair for the current non-zero element
                pairs.append((0, elem))
                nonzero_prev = True
            else:
                # If the current element is zero, increment the zero count
                zero_count += 1

                # If the previous element was non-zero, add a pair for the current zero
                if nonzero_prev:
                    pairs.append((1, 0))
                    nonzero_prev = False

        # Add a pair for any remaining zeros at the end of the vector
        if zero_count > 0:
            pairs.append((zero_count, 0))

        return pairs

    return [run_length_encoding(vector) for vector in vectors]


def huffman_encoding_blocks(vectors):
    def huffman_encoding(pairs):
        binary_code = ''
        # Iterate over the pairs and append the corresponding binary code to the string
        for pair in pairs:
            binary_code += huffman_code(pair[0]) + huffman_code(pair[1])
        return binary_code

    return [huffman_encoding(pairs) for pairs in vectors]


image = create_random_image()
ycbcr_image = rgb_to_ycbcr(image)

blocks = sample(ycbcr_image)
print(f"{len(blocks)} blocks")
print(blocks)

print("DCT:")
dct_block = dct_encode_blocks(blocks)
print(dct_block)

print("ZigZag scan:")
zigzag = zigzag_scan_blocs(dct_block)
print(zigzag)

print("Length encoding:")
encoding = encode_vectors(zigzag)
print(encoding)

print("Huffman encoding:")
huffman = " ".join(huffman_encoding_blocks(encoding))
print(huffman)
print()
initial_capacity = 24 * 16 * 16
print(f"Изначальный обьем {initial_capacity} бит.")
print(f"Закодировано с помощь {len(huffman)} бит.")
print(f"Коэф. сжатия = {initial_capacity / len(huffman)}")
