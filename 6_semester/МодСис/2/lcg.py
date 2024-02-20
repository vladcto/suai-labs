import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
import random


def calculate_R_hat(z, T, s):
    sum_product = 0
    for i in range(T - s):
        sum_product += z[i] * z[i + s]
    R_hat = 12 * sum_product / (T - s) - 3
    return R_hat


class FishGenerator:
    def __init__(self, seed=None):
        self.A = [random.randint(0, 2**32 - 1) for _ in range(55)]
        self.B = [random.randint(0, 2**32 - 1) for _ in range(52)]
        self.index_A = 0
        self.index_B = 0
        random.seed(seed)

    def generate(self):
        while True:
            self.A[self.index_A] = (
                self.A[(self.index_A - 55) % 55] + self.A[(self.index_A - 24) % 55]) % (2**32)
            self.B[self.index_B] = (
                self.B[(self.index_B - 52) % 52] + self.B[(self.index_B - 19) % 52]) % (2**32)
            if self.B[self.index_B] & 1:
                yield self.A[self.index_A] / (2**32), self.B[self.index_B] / (2**32)
            self.index_A = (self.index_A + 1) % 55
            self.index_B = (self.index_B + 1) % 52


fish_gen = FishGenerator().generate()
generated_values = [next(fish_gen) for _ in range(501)]

# 2 task
values_A, values_B = zip(*generated_values)
mean_A = np.mean(values_A)
variance_A = np.var(values_A)

mean_B = np.mean(values_B)
variance_B = np.var(values_B)

print(f"Mean of A: {mean_A}, Variance of A: {variance_A}")
print(f"Mean of B: {mean_B}, Variance of B: {variance_B}")

# 3 task
plt.hist(values_A, bins='auto', density=True)
plt.title("Histogram for A")
plt.show()

plt.hist(values_B, bins='auto', density=True)
plt.title("Histogram for B")
plt.show()

ks_statistic_A, p_value_A = stats.kstest(values_A, 'uniform')
print(
    f"Kolmogorov-Smirnov test for A: KS-statistic = {ks_statistic_A}, p-value = {p_value_A}")

ks_statistic_B, p_value_B = stats.kstest(values_B, 'uniform')
print(
    f"Kolmogorov-Smirnov test for B: KS-statistic = {ks_statistic_B}, p-value = {p_value_B}")

# 4 task
s_values = [2, 5, 10]
T_values = {s: [] for s in s_values}
R_hat_values = {s: [] for s in s_values}

for s in s_values:
    for T in range(10, 501, 10):
        if T > s:
            R_hat = calculate_R_hat(values_A, T, s)
            R_hat_values[s].append(R_hat)
            T_values[s].append(T)

for s in s_values:
    plt.plot(T_values[s], R_hat_values[s], label=f"s={s}")

plt.xlabel("T")
plt.ylabel("R_hat")
plt.legend()
plt.show()
