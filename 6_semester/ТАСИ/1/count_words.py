from math import ceil, log2


def count_letters(word):
    letter_counts = {}
    for letter in word:
        if letter in letter_counts:
            letter_counts[letter] += 1
        else:
            letter_counts[letter] = 1
    return letter_counts

word = "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ"
letter_counts = count_letters(word)

for letter, count in letter_counts.items():
    print(f"Letter: {letter}, Count: {count}")

print("Total bits: ", len(word) * ceil(log2(len(letter_counts))))

nums = [0.066, 0.2 , 0.066, 0.066, 0.1667, 0.066, 0.066, 0.066, 0.1 , 0.066, 0.066]
sum = 0
for i in nums:
    sum += i * log2(i)
print()
print()
print()
print()
print()
print()
print()
print()
print()
print()
print()
print(-sum)