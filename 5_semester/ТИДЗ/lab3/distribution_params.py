from scipy.stats import skew
from typing import List
from typing import List, Tuple
from scipy.stats import chi2, t, skewnorm
from typing import List, Optional
import numpy as np


def sample_size(data: List[float]) -> int:
    return len(data)


def calculate_Xmin(data: List[float]) -> Optional[float]:
    if not data:
        return None
    return min(data)


def calculate_Xmax(data: List[float]) -> Optional[float]:
    if not data:
        return None
    return max(data)


def calculate_mean(data: List[float]) -> Optional[float]:
    if not data:
        return None
    return sum(data) / len(data)


def degrees_of_freedom(data: List[float]) -> int:
    return len(data) - 1


def calculate_variance(data: List[float]) -> float:
    n = len(data)
    
    mean = sum(data) / n
    
    squared_diff = sum((x - mean) ** 2 for x in data)
    
    variance = squared_diff / n
    
    return variance


def calculate_std_dev(data: List[float]) -> Optional[float]:
    variance = calculate_variance(data)
    return variance ** 0.5


def calculate_skewness(data: List[float]) -> Optional[float]:
    mean = calculate_mean(data)
    std_dev = calculate_std_dev(data)
    return sum((x - mean) ** 3 for x in data) / (len(data) * std_dev ** 3)


def calculate_kurtosis(data: List[float]) -> Optional[float]:
    mean = calculate_mean(data)
    std_dev = calculate_std_dev(data)
    return sum((x - mean) ** 4 for x in data) / (len(data) * std_dev ** 4) - 3


def calculate_median(data: List[float]) -> Optional[float]:
    sorted_data = sorted(data)
    n = len(sorted_data)
    if n % 2 == 0:
        # Если число элементов четное, медиана - среднее двух центральных элементов
        middle1 = sorted_data[n // 2 - 1]
        middle2 = sorted_data[n // 2]
        return (middle1 + middle2) / 2
    else:
        # Если число элементов нечетное, медиана - центральный элемент
        return sorted_data[n // 2]


def calculate_range(data: List[float]) -> Optional[float]:
    return max(data) - min(data)


def confidence_interval_mean(data: List[float], confidence_level: float = 0.95) -> Tuple[float, float]:
    mean_value = calculate_mean(data)
    std_dev_value = calculate_std_dev(data)
    sample_size_value = sample_size(data)

    if mean_value is None or std_dev_value is None or sample_size_value is None:
        return None

    # Вычисляем стандартную ошибку среднего
    standard_error = std_dev_value / (sample_size_value ** 0.5)

    # Вычисляем критическое значение t-распределения
    df = degrees_of_freedom(data)
    if df is None:
        return None

    t_value = t.ppf((1 + confidence_level) / 2, df)

    # Вычисляем доверительный интервал
    margin_of_error = t_value * standard_error
    lower_bound = mean_value - margin_of_error
    upper_bound = mean_value + margin_of_error

    return lower_bound, upper_bound


def confidence_interval_variance(data: List[float], confidence_level: float = 0.95) -> Tuple[float, float]:
    variance_value = calculate_variance(data)
    sample_size_value = sample_size(data)

    if variance_value is None or sample_size_value is None:
        return None

    # Вычисляем критические значения хи-квадрат распределения
    df = degrees_of_freedom(data)
    if df is None:
        return None

    chi2_lower = chi2.ppf((1 - confidence_level) / 2, df)
    chi2_upper = chi2.ppf((1 + confidence_level) / 2, df)

    # Вычисляем доверительный интервал
    lower_bound = (sample_size_value - 1) * variance_value / chi2_upper
    upper_bound = (sample_size_value - 1) * variance_value / chi2_lower

    return lower_bound, upper_bound


def confidence_interval_skewness(data: List[float], confidence_level: float = 0.95) -> Tuple[float, float]:
    skewness_value = calculate_skewness(data)
    sample_size_value = sample_size(data)

    if skewness_value is None or sample_size_value is None:
        return None

    # Вычисляем стандартную ошибку асимметрии
    std_error_skewness = (6 * sample_size_value * (sample_size_value - 1) / (
        (sample_size_value - 2) * (sample_size_value + 1) * (sample_size_value + 3))) ** 0.5

    # Вычисляем критическое значение t-распределения
    df = degrees_of_freedom(data)
    if df is None:
        return None

    t_value = t.ppf((1 + confidence_level) / 2, df)

    # Вычисляем доверительный интервал
    lower_bound = skewness_value - t_value * std_error_skewness
    upper_bound = skewness_value + t_value * std_error_skewness

    return lower_bound, upper_bound


def confidence_interval_kurtosis(data: List[float], confidence_level: float = 0.95) -> Tuple[float, float]:
    kurtosis_value = calculate_kurtosis(data)
    sample_size_value = sample_size(data)

    if kurtosis_value is None or sample_size_value is None:
        return None

    # Вычисляем стандартную ошибку эксцесса
    std_error_kurtosis = (24 * sample_size_value * (sample_size_value - 2) * (sample_size_value - 3) / (
        (sample_size_value + 1) * (sample_size_value + 1) * (sample_size_value + 3) * (sample_size_value + 5))) ** 0.5

    # Вычисляем критическое значение t-распределения
    df = degrees_of_freedom(data)
    if df is None:
        return None

    t_value = t.ppf((1 + confidence_level) / 2, df)

    # Вычисляем доверительный интервал
    lower_bound = kurtosis_value - t_value * std_error_kurtosis
    upper_bound = kurtosis_value + t_value * std_error_kurtosis

    return lower_bound, upper_bound


def skewness_variance(data):
    n = len(data)
    return 6 * (n - 1) / (n + 1) / (n + 3)


def kurtosis_variance(values: List[float]) -> float:
    # 24 * n * (n - 2) * (n - 3) / (n + 1)**2 / (n + 3) / (n + 5)
    excess_variance = np.var(
        values, ddof=1) * np.var(values, ddof=2) / (len(values) * (len(values) - 1))
    return excess_variance
