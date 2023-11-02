import math as math
import numpy as np
from scipy.integrate import simpson
from scipy.integrate import quad
from typing import List

def spectrum(freq: float, fx, interval):
    step = interval[1] - interval[0]
    real = 0
    imag = 0
    for i in range(len(interval)):
        t = interval[i]
        real += fx(t) * np.cos(2 * np.pi * freq * t) * step
        imag += fx(t) * np.sin(2 * np.pi * freq * t) * step
    return np.sqrt(real ** 2 + imag ** 2)

def energy_spectrum(fx, interval, step=0.001):
    return quad(lambda x: fx(x) ** 2, *interval)[0]/1


def energy_from_amplitude_spectrum(amplitude_spectrum):
    energy = sum(amplitude**2 for amplitude in amplitude_spectrum)
    return energy
