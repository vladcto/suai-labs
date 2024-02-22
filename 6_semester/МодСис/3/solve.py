import matplotlib.pyplot as plt
import numpy as np
from fish_generator import FishGenerator
from generators import *


def plot_histogram(random_vars, func_name):
    plt.hist(random_vars, bins='auto', density=True)
    plt.title(f'Histogram of {func_name}')
    plt.show()


fish_gen = FishGenerator(seed=42)

num_vars = 10000

random_vars = [exponential_random_variable(
    next(fish_gen.generate())[0], lambd=1) for _ in range(num_vars)]
plot_histogram(random_vars, 'exponential_random_variable')
print(f"Mean for exponential_random_variable: {np.mean(random_vars)}")
print(f"Variance for exponential_random_variable: {np.var(random_vars)}\n")

random_vars = [uniform_random_variable(
    next(fish_gen.generate())[0], A=0, B=100) for _ in range(num_vars)]
plot_histogram(random_vars, 'uniform_random_variable')
print(f"Mean for uniform_random_variable: {np.mean(random_vars)}")
print(f"Variance for uniform_random_variable: {np.var(random_vars)}\n")

random_vars = [erlang_random_variable(
    next(fish_gen.generate())[0], lambd=1, k=2) for _ in range(num_vars)]
plot_histogram(random_vars, 'erlang_random_variable')
print(f"Mean for erlang_random_variable: {np.mean(random_vars)}")
print(f"Variance for erlang_random_variable: {np.var(random_vars)}\n")

random_vars = [item for sublist in [normal_random_variable(
    *next(fish_gen.generate())) for _ in range(num_vars)] for item in sublist]
plot_histogram(random_vars, 'normal_random_variable')
print(f"Mean for normal_random_variable: {np.mean(random_vars)}")
print(f"Variance for normal_random_variable: {np.var(random_vars)}\n")

random_vars = [rayleigh_random_variable(
    *next(fish_gen.generate())) for _ in range(num_vars)]
plot_histogram(random_vars, 'rayleigh_random_variable')
print(f"Mean for rayleigh_random_variable: {np.mean(random_vars)}")
print(f"Variance for rayleigh_random_variable: {np.var(random_vars)}\n")

lambd = 1
print(f"Theoretical mean for exponential_random_variable: {1 / lambd}")
print(
    f"Theoretical variance for exponential_random_variable: {1 / (lambd**2)}\n")

A = 0
B = 100
print(f"Theoretical mean for uniform_random_variable: {(A + B) / 2}")
print(f"Theoretical variance for uniform_random_variable: {(B - A)**2 / 12}\n")

lambd = 1
k = 2
print(f"Theoretical mean for erlang_random_variable: {k / lambd}")
print(f"Theoretical variance for erlang_random_variable: {k / (lambd**2)}\n")

mu = 0
sigma = 1
print(f"Theoretical mean for normal_random_variable: {mu}")
print(f"Theoretical variance for normal_random_variable: {sigma**2}\n")

sigma = 1
print(
    f"Theoretical mean for rayleigh_random_variable: {np.sqrt(np.pi / 2) * sigma}")
print(
    f"Theoretical variance for rayleigh_random_variable: {(4 - np.pi) / 2 * sigma**2}\n")
