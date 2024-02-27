import math


def exponential_random_variable(z, lambd):
    return -math.log(z) / lambd


def uniform_random_variable(z, A, B):
    return A + (B - A) * z


def erlang_random_variable(z, lambd, k):
    return sum(exponential_random_variable(z, lambd) for _ in range(k))


def normal_random_variable(z1, z2):
    x1 = math.sqrt(-2 * math.log(z1)) * math.cos(2 * math.pi * z2)
    x2 = math.sqrt(-2 * math.log(z1)) * math.sin(2 * math.pi * z2)
    return x1, x2


def rayleigh_random_variable(z1, z2):
    r = math.sqrt(-2 * math.log(z1))
    theta = 2 * math.pi * z2
    x = r * math.cos(theta) 
    return abs(x) 
