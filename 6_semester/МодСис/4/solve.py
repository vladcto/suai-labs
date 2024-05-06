from collections import Counter
import matplotlib.pyplot as plt
from fish_generator import FishGenerator


def calculate_properties(items):
    mode = sum([p * x for p, x in items])
    dispersion = sum([p * (x**2) for p, x in items]) - mode ** 2
    print(f"Мода = {mode}")
    print(f"Дисперсия = {dispersion}")


edges = {
    0.005: -72.4,
    0.240: -68.5,
    0.251: -68.4,
    0.003: -43.5,
    0.271: -6.5,
    0.049: 1.2,
    0.181: 31.0,
}


def match_edges(num):
    for p, x in edges.items():
        num = num - p
        if num <= 0:
            return x
    return 0



num_generator = FishGenerator().generate()
generated_values = [match_edges(next(num_generator)[0]) for _ in range(500)]
print(f"Первые 30 значений: {generated_values[:30]}\n")

value_counts = Counter(generated_values)
total_values = len(generated_values)
generated_prob = dict(
    (count / total_values, x)
    for x, count in value_counts.items()
)

print("=== Теоретические ===")
calculate_properties(edges.items())
print()
print("=== Эмперические ===")
calculate_properties(generated_prob.items())


# Draw graphics
plt.bar(edges.values(), edges.keys(),
        width=1, color='blue', alpha=0.5, label='Теор.')
plt.bar(generated_prob.values(), generated_prob.keys(),
        width=1, color='orange', alpha=0.5, label='Эмп.')

plt.xlabel('Значения случайной величины')
plt.ylabel('Вероятность')
plt.title('Гистограммы распределения')
plt.legend()
plt.show()
