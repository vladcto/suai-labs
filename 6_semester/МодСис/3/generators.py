import math

import numpy as np


def exponential_random_variable(z, lambd):
    return -math.log(z) / lambd


def uniform_random_variable(z, A, B):
    return A + (B - A) * z


def erlang_random_variable(generator, lambd, k):
    return np.random.gamma(k, scale=1/lambd)

def normal_random_variable(z1, z2, mu=2):
    x1 = math.sqrt(-2 * math.log(z1)) * math.cos(2 * math.pi * z2) + mu
    x2 = math.sqrt(-2 * math.log(z1)) * math.sin(2 * math.pi * z2) + mu
    return x1, x2


def rayleigh_random_variable(z, sigma=1):
    return sigma * math.sqrt(-2 * math.log(1 - z))
