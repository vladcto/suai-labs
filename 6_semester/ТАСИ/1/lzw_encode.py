def lzw_encode(input_string, dictionary):
    code = []
    s = ""
    for c in input_string:
        sc = s + c
        if sc in dictionary:
            s = sc
        else:
            code.append(dictionary[s])
            dictionary[sc] = len(dictionary)
            s = c
    if s:
        code.append(dictionary[s])

    for i, (key, value) in enumerate(dictionary.items()):
        print(f"[{key}: {value}]", end="    ")
        if (i + 1) % 4 == 0:
            print()
    print()
    return code, max(code).bit_length() * len(code)


input = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ" * 20
alphabet = list(set(input))

dictionary = {alphabet[i]: i for i in range(len(alphabet))}
for i in range(len(dictionary), 256):
    dictionary[chr(i + 1024)] = i

print(dictionary)

code, size_in_bits = lzw_encode(input, dictionary)

print("Encoded data: ", code)
print("Initial data: ", len(input) * 8)
print("Coded data  : ", size_in_bits)
