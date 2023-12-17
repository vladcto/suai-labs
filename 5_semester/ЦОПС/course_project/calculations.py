import math
import random

import numpy as np
from scipy import signal


def generate_rayleigh_noise(sigma: float = 0.3) -> float:
    u = random.random()
    return sigma * math.sqrt(-2 * math.log(1 - u))


def generate_awgn_noise(mean: float = 0, std_dev: float = 1) -> float:
    return random.gauss(mean, std_dev)


def generate_noise(coef: float) -> float:
    return (generate_awgn_noise() + generate_rayleigh_noise()) * coef


def st(t: float) -> float:
    return 2 * np.sin(t * 2 * math.pi)


def quantize_signal(value: float, num_bits=3) -> float:
    min_value = -2.0
    max_value = 2.0
    levels = 2**num_bits
    step = (max_value - min_value) / levels
    rounded_value = round((value - min_value) / step)
    return np.clip(rounded_value, 0, levels) * step + min_value


def butter_lowpass_filter(signal_values: np.ndarray, cutoff_frequency: float, sampling_rate: float) -> np.ndarray:
    nyquist = 0.5 * sampling_rate
    normal_cutoff = cutoff_frequency / nyquist
    b, a = signal.butter(4, normal_cutoff, btype='low', analog=False)

    return signal.filtfilt(b, a, signal_values)


def pwm_signal(value: float) -> float:
    return 1 if value > 0 else 0
