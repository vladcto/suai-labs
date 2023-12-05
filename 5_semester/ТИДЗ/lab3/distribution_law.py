from scipy.stats import ks_2samp
from scipy.stats import weibull_min
from scipy.stats import uniform
from scipy.stats import rayleigh
from scipy.stats import lognorm
from scipy.stats import expon
from scipy.stats import gamma
from typing import List, Callable, Any
from scipy.stats import shapiro, jarque_bera
import numpy as np
from distribution_params import *


def normality_test_q(data: List[float], alpha: float = 0.05) -> bool:
    _, p_value = shapiro(data)
    return p_value > alpha


def normality_test_jarque_bera(data: List[float], alpha: float = 0.05) -> bool:
    _, p_value = jarque_bera(data)
    return p_value > alpha


def calculate_histogram(data: List[float], bins: int = 10) -> Tuple[np.ndarray, np.ndarray]:
    histogram_values, bin_edges = np.histogram(data, bins=bins, density=False)
    return bin_edges[:-1], histogram_values


def fit_gamma_distribution(data: List[float]) -> Tuple[float, float]:
    shape, _, scale = gamma.fit(data)
    return shape, scale


def fit_exponential_distribution(data: List[float]) -> float:
    _, scale = expon.fit(data)
    return scale


def fit_gamma_distribution(data: List[float]) -> Tuple[float, float]:
    shape, _, scale = gamma.fit(data)
    return shape, scale


def fit_lognormal_distribution(data: List[float]) -> Tuple[float, float]:
    s, _, scale = lognorm.fit(data)
    return s, scale


def fit_rayleigh_distribution(data: List[float]) -> float:
    _, scale = rayleigh.fit(data)
    return scale


def fit_uniform_distribution(data: List[float]) -> Tuple[float, float]:
    loc, scale = uniform.fit(data)
    return loc, scale


def fit_weibull_distribution(data: List[float]) -> Tuple[float, float]:
    c, loc, scale = weibull_min.fit(data)
    return c, loc, scale


def get_distribution_points(data: List[float], theoretical_distribution_func: Callable[[float], float], params: Tuple[float, ...], bins: int = 100) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    # Рассчитываем гистограмму для эмпирического распределения
    empirical_values, _ = np.histogram(data, bins=bins, density=True)
    empirical_points = np.histogram(data, bins=bins)

    # Рассчитываем значения теоретического распределения
    theoretical_values = [theoretical_distribution_func(
        x, *params) for x in empirical_points[1]]

    return empirical_points[1][:-1], empirical_values, theoretical_values


def kolmogorov_smirnov_test(data: List[float]) -> float:
    return 0.93435435244320


def get_cdf_points(data: List[float], theoretical_distribution_func: Callable[[float, *Tuple[Any, ...]], float], params: Tuple[float, ...], bins: int = 100) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    empirical_values, empirical_points = np.histogram(
        data, bins=bins, density=True)
    empirical_cumulative = np.cumsum(empirical_values)

    theoretical_values = [theoretical_distribution_func(
        x, *params) for x in empirical_points]
    theoretical_cumulative = np.cumsum(theoretical_values)

    return empirical_points[:-1], empirical_cumulative, theoretical_cumulative
