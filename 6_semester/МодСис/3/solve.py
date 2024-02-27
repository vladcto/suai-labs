import matplotlib.pyplot as plt
import numpy as np
from fish_generator import FishGenerator
from generators import *


def plot_histogram(random_vars, func_name):
    plt.hist(random_vars, bins='auto', density=True)
    plt.title(f'{func_name}')
    plt.show()


fish_gen = FishGenerator(seed=42)

num_vars = 1000

print("=============\n")

print("Экспоненциальная СВ")
lambd = 0.2
random_vars = [exponential_random_variable(
    next(fish_gen.generate())[0], lambd=lambd) for _ in range(num_vars)]
plot_histogram(random_vars, 'Экспоненциальная СВ')
print(f"фкт МО        : {np.mean(random_vars)}")
print(f"фкт дисперсия : {np.var(random_vars)}\n")
print(f"эмп МО       : {1 / lambd}")
print(f"эмп дисперсия: {1 / (lambd**2)}\n")

print("=============\n")

print("Равномерная СВ")
A = 0
B = 100
random_vars = [uniform_random_variable(
    next(fish_gen.generate())[0], A=A, B=B) for _ in range(num_vars)]
plot_histogram(random_vars, 'Равномерная СВ')
print(f"фкт МО        : {np.mean(random_vars)}")
print(f"фкт дисперсия : {np.var(random_vars)}\n")
print(f"эмп МО       : {(A + B) / 2}")
print(f"эмп дисперсия: {(B - A)**2 / 12}\n")

print("=============\n")

print("Эрланговская СВ")
lambd = 0.2
k = 1
random_vars = [erlang_random_variable(
    generator=lambda: next(fish_gen.generate())[0], lambd=lambd, k=k) for _ in range(num_vars)]
plot_histogram(random_vars, 'Эрланговская СВ')
print(f"фкт МО        : {np.mean(random_vars)}")
print(f"фкт дисперсия : {np.var(random_vars)}\n")
print(f"эмп МО       : {k / lambd}")
print(f"эмп дисперсия: {k / (lambd**2)}\n")

print("=============\n")

print("Нормальная СВ")
mu = 2
random_vars = [item for sublist in [normal_random_variable(
    *next(fish_gen.generate()), mu=mu) for _ in range(num_vars)] for item in sublist]
plot_histogram(random_vars, 'Нормальная СВ')
print(f"фкт МО        : {np.mean(random_vars)}")
print(f"фкт дисперсия : {np.var(random_vars)}\n")
print(f"эмп МО       : {mu}")
print(f"эмп дисперсия: {1}\n")

print("=============\n")

print("Распределения Рэлея")
sigma = 2
random_vars = [rayleigh_random_variable(
    next(fish_gen.generate())[0], sigma=sigma) for _ in range(num_vars)]
plot_histogram(random_vars, 'Распределения Рэлея')
print(f"фкт МО        : {np.mean(random_vars)}")
print(f"фкт дисперсия : {np.var(random_vars)}\n")
print(f"эмп МО       : {np.sqrt(np.pi / 2) * sigma}")
print(f"эмп дисперсия: {(4 - np.pi) / 2 * sigma**2}\n")
