import numpy as np
import matplotlib.pyplot as plt
from fish_generator import FishGenerator


def plot_histogram(generated_values, K):
    bins = [i/K for i in range(K+1)]
    values_A = [value[0] for value in generated_values]

    counts, _ = np.histogram(values_A, bins=bins)
    
    frequencies = counts / len(values_A)
    plt.bar(bins[:-1], frequencies, width=1/K, align='edge')
    plt.xlabel('Значение')
    plt.ylabel('Частота')
    plt.show()


def calculate_correlation(generated_values, s, T):
    values_A = [value[0] for value in generated_values[:T]]

    values_A1 = values_A[:-s]
    values_A2 = values_A[s:]

    sum_product = sum(a*b for a, b in zip(values_A1, values_A2))
    if T - s != 0:
        R_hat = 12 * sum_product / (T - s) - 3
    else:
        R_hat = None
    return R_hat


length = 10000
fish_gen = FishGenerator().generate()
generated_values = [next(fish_gen) for _ in range(length)]

# 2 task
values_A, values_B = zip(*generated_values)
mean_A = np.mean(values_A)
variance_A = np.var(values_A)

mean_B = np.mean(values_B)
variance_B = np.var(values_B)

print(f"Ошибка МО A: {mean_A}")
print(f"Ошибка МО B: {mean_B}")
print(f"Ошибка дисперсии A: {variance_A}")
print(f"Ошибка дисперсии B: {variance_B}")

# 3 task
plot_histogram(generated_values, K=10)

# 4 task
s_values = [2, 5, 10]
T_values = range(10, len(generated_values), 10)

correlations = [
    [calculate_correlation(generated_values, s, T) for T in T_values]
    for s in s_values
]

for s, correlation in zip(s_values, correlations):
    plt.plot(T_values, correlation, label=f's={s}')

plt.xlabel('T')
plt.ylabel('R_hat')
plt.legend()
plt.show()
