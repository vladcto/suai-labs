from statsmodels.distributions.empirical_distribution import ECDF
from typing import List
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import genextreme, gamma, expon, lognorm, rayleigh, uniform, weibull_min, gumbel_r


def plot_data_and_approximation(x_values, y_values, approx_points, approx_title: str):
    plt.figure(figsize=(8, 6))

    plt.scatter(x_values, y_values, label='Исходные данные', color='blue')

    x_approx, y_approx = zip(*approx_points)
    plt.plot(x_approx, y_approx, label='Аппроксимация', color='red')

    plt.title(approx_title)
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.legend()
    plt.grid(True)

    plt.show()


def plot_histogram(values, bins=32):
    plt.figure(figsize=(8, 6))

    plt.hist(values, bins=bins, color='blue', edgecolor='black', alpha=0.7)

    plt.title('Гистограмма распределения случайной величины')
    plt.xlabel('Значения')
    plt.ylabel('Частота')
    plt.grid(True)

    plt.show()


def plot_all_distributions(data: List[float]):
    plt.figure(figsize=(10, 8))

    plt.hist(data, bins=20, density=True, alpha=0.7,
             color='blue', edgecolor='black')

    x = np.linspace(min(data), max(data), 1000)

    exp_params = expon.fit(data)
    exp_pdf = expon.pdf(x, *exp_params)
    plt.plot(x, exp_pdf, label='Exponential', color='red')

    gamma_params = gamma.fit(data)
    gamma_pdf = gamma.pdf(x, *gamma_params)
    plt.plot(x, gamma_pdf, label='Gamma', color='green')

    lognorm_params = lognorm.fit(data)
    lognorm_pdf = lognorm.pdf(x, *lognorm_params)
    plt.plot(x, lognorm_pdf, label='Lognormal', color='purple')

    rayleigh_params = rayleigh.fit(data)
    rayleigh_pdf = rayleigh.pdf(x, *rayleigh_params)
    plt.plot(x, rayleigh_pdf, label='Rayleigh', color='orange')

    uniform_params = uniform.fit(data)
    uniform_pdf = uniform.pdf(x, *uniform_params)
    plt.plot(x, uniform_pdf, label='Uniform', color='brown')

    weibull_params = weibull_min.fit(data)
    weibull_pdf = weibull_min.pdf(x, *weibull_params)
    plt.plot(x, weibull_pdf, label='Weibull', color='pink')

    gumbel_params = gumbel_r.fit(data)
    gumbel_pdf = gumbel_r.pdf(x, *gumbel_params)
    plt.plot(x, gumbel_pdf, label='Gumbel', color='cyan')

    plt.title('Сравнение различных распределений')
    plt.xlabel('Значения')
    plt.ylabel('Плотность вероятности')
    plt.legend()
    plt.grid(True)

    plt.show()


def plot_empirical_vs_theoretical_cdf(data: List[float], theoretical_distribution='genextreme'):
    plt.figure(figsize=(10, 6))

    ecdf = ECDF(data)
    x_values = np.sort(data)
    y_values_empirical = ecdf(x_values)

    if theoretical_distribution == 'genextreme':
        params = genextreme.fit(data)
        y_values_theoretical = genextreme.cdf(x_values, *params)

    plt.plot(x_values, y_values_empirical,
             label='Эмпирическая ФР', color='blue')
    plt.plot(x_values, y_values_theoretical,
             label='Теоретическая ФР', linestyle='--', color='red')

    plt.title('Сравнение Эмпирической и Теоретической Функций Распределения')
    plt.xlabel('Значения')
    plt.ylabel('Вероятность')
    plt.legend()
    plt.grid(True)

    plt.show()
