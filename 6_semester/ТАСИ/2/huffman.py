import random

def huffman_code(num):
    if num > 256 or num < -256:
        return "1111111"
    huffman_code = {i: ''.join(random.choices(['0', '1'], k=9)) for i in range(-256, 257)}
    return huffman_code[num]