import numpy as np


def approximate_polynomial(x_values, y_values, degree=3):
    coefficients = np.polyfit(x_values, y_values, degree)
    approx_polynomial = np.poly1d(coefficients)

    x_range = np.linspace(min(x_values), max(x_values), 100)
    approx_points = list(zip(x_range, approx_polynomial(x_range)))

    return (approx_points, coefficients)


def approximate_basis_functions(x_values, y_values, degree):
    basis_matrix = np.vander(x_values, degree + 1)

    coefficients, _, _, _ = np.linalg.lstsq(basis_matrix, y_values, rcond=None)

    x_approx = np.linspace(min(x_values), max(x_values), 1000)
    basis_matrix_approx = np.vander(x_approx, degree + 1)
    y_approx = np.dot(basis_matrix_approx, coefficients)

    approx_points = list(zip(x_approx, y_approx))

    return approx_points


def generate_random_data(size: int = 100, noise_factor: float = 0.1):
    x_values = np.linspace(0, 1, size)
    true_curve = np.sin(2 * np.pi * x_values)
    noise = noise_factor * np.random.randn(size)
    y_values = true_curve + noise

    return x_values, y_values
