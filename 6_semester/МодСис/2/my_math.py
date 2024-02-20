def calculate_R_hat(z, T, s):
    sum_product = 0
    for i in range(T - s):
        sum_product += z[i] * z[i + s]
    R_hat = 12 * sum_product / (T - s) - 3
    return R_hat