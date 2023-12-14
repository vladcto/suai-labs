import warnings
from matplotlib import pyplot as plt
import reader as reader
import distribution_params as dparam
import distribution_law as dlaw
import approximation as aprx
import ploter as ploter

warnings.filterwarnings('ignore')

FILE_PATH = "5.txt"
rnd_values = reader.read_random_variables(FILE_PATH)

print("Числовые параметры распределения:")
print()			
print(f"Обьем выборки = {dparam.sample_size(rnd_values)}")
print(f"Xmax = {dparam.calculate_Xmax(rnd_values)}")
print(f"Xmin = {dparam.calculate_Xmin(rnd_values)}")
print(f"Мат. ожидание = {dparam.calculate_mean(rnd_values)}")
print(f"Степени свободы = {dparam.degrees_of_freedom(rnd_values)}")
print(f"Дисперсия = {dparam.calculate_variance(rnd_values)}")
print(f"СКО = {dparam.calculate_std_dev(rnd_values)}")
print(f"Ассиметрия = {dparam.calculate_skewness(rnd_values)}")
print(f"Эксцесс = {dparam.calculate_kurtosis(rnd_values)}")
print(f"Медиана = {dparam.calculate_median(rnd_values)}")
print(f"Размах = {dparam.calculate_range(rnd_values)}")
print()
print(f"Дисперсия ассимтерии = {dparam.skewness_variance(rnd_values)}")
print(f"Дисперсия эксцесса = {dparam.kurtosis_variance(rnd_values)}")
print(f"Доверительные интервалы при q = 0.95:")
print(f"МО - {dparam.confidence_interval_mean(rnd_values)}")
print(f"Дисперсия - {dparam.confidence_interval_variance(rnd_values)}")
print(f"Ассиметрия - {dparam.confidence_interval_skewness(rnd_values)}")
print(f"Эксцесс - {dparam.confidence_interval_kurtosis(rnd_values)}")
print()
print()
print("Закон распределения:")
print(f"Простейший тест: {dlaw.normality_test_q(rnd_values)}")
print(f"Тест Жарка-Бера: {dlaw.normality_test_jarque_bera(rnd_values)}")
ploter.plot_all_distributions(rnd_values)
ploter.plot_empirical_vs_theoretical_cdf(rnd_values)
print(f"Проверка по критерию Колмагорова {dlaw.kolmogorov_smirnov_test(rnd_values)}")

# Апроксимация
print()
x_data, y_data = aprx.generate_random_data()
power_coefficients, coeffs = aprx.approximate_polynomial(x_data, y_data, 4)
ploter.plot_data_and_approximation(x_data, y_data, power_coefficients, "Апроксимация полиномом 5-го порядка")
print(f"Коэффиценты: {coeffs}")
approx_points = aprx.approximate_basis_functions(x_data, y_data, 8)
ploter.plot_data_and_approximation(x_data, y_data, approx_points, "Апроксимация базисными функциями")
