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
        print(f"{key}: {value}", end="    ")
        if (i + 1) % 4 == 0:
            print()
    print()
    return code, max(code).bit_length() * len(code)


input = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ"
dictionary = {element: i for i, element in enumerate(set(input))}

code, size_in_bits = lzw_encode(input, dictionary)

print("Encoded data: ", code)
print("Size of the encoded data in bits: ", size_in_bits)
