word = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ"


def fill_word(word, dict):
    result = "["
    bits = 0
    for i in word:
        bits += len(dict[i])
        if (i == " "):
            result += f"]\\allowbreak{dict[i]}\\allowbreak["
        else:
            result += f"\,{dict[i]}\,"
    result += "]"
    print(result)
    print(f"Bits: {bits}")


shenon = {
    "К": "111",
    "Т": "1101",
    "Ш": "1100",
    "Р": "0111",
    "Х": "0110",
    "Д": "0101",
    "У": "0100",
    "Б": "0011",
    "А": "0010",
    " ": "000",
    "О": "10",
}

xaphan = {
    "О": "11",
    " ": "101",
    "К": "100",
    "Ш": "0111",
    "Р": "0110",
    "Х": "0101",
    "Д": "0100",
    "У": "0011",
    "Б": "0010",
    "А": "0001",
    "Т": "0000",
}

fill_word(word, shenon)
print()
fill_word(word, xaphan)
