import math as math
import numpy as np

n = 10

fn = 3 * n
t = 10 / fn
step = 0.001
fx = lambda x: math.sin(2 * math.pi * fn * x)

interval = np.arange(0, t, step)
fx_dots = np.vectorize(fx)(interval)
