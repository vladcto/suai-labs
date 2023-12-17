import copy
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from calculations import *


num_points = 150
cutoff_frequency = 0.5
sampling_rate = 10
time_interval = 32

fig, axs = plt.subplots(3, 2, figsize=(12, 6))
fig.suptitle("Исследование методов АЦП и ЦАП")

original_data = [0 for _ in range(num_points)]
noised_data = copy.copy(original_data)
signal_data = copy.copy(original_data)
quantized_data = copy.copy(original_data)
filtered_data = copy.copy(original_data)
pwm_data = copy.copy(original_data)

t = 0
end = num_points - 20
start = 20
length = end - start
t_values = np.linspace(0, 10, length)
    
def update(_):
    global t
    t = t + time_interval / 1000

    original_value = st(t)
    original_data.pop(0)
    original_data.append(original_value)
    axs[0, 0].clear()
    axs[0, 0].set_ylim([-2.1, 2.1])
    axs[0, 0].plot(t_values, original_data[start:end])
    axs[0, 0].set_title('Синусоида')

    noise_value = generate_noise(coef=0.5)
    noised_data.pop(0)
    noised_data.append(noise_value)
    axs[0, 1].clear()
    axs[0, 1].set_ylim([-2.1, 2.1])
    axs[0, 1].plot(t_values, noised_data[start:end])
    axs[0, 1].set_title('Шум')

    signal_value = original_data[-1] + noised_data[-1]
    signal_data.pop(0)
    signal_data.append(signal_value)
    axs[1, 0].clear()
    axs[1, 0].set_ylim([-2.5, 2.5])
    axs[1, 0].plot(t_values, signal_data[start:end])
    axs[1, 0].set_title('Сигнал')

    quantized_value = quantize_signal(signal_value)
    quantized_data.pop(0)
    quantized_data.append(quantized_value)
    axs[1, 1].clear()
    axs[1, 1].set_ylim([-2.1, 2.1])
    axs[1, 1].plot(t_values, quantized_data[start:end])
    axs[1, 1].set_title('Квантование')

    pwm_data = [pwm_signal(x) for x in quantized_data]
    axs[2, 0].clear()
    axs[2, 0].set_ylim([-0.1, 1.1])
    axs[2, 0].plot(t_values, pwm_data[start:end])
    axs[2, 0].set_title('ШИМ')

    filtered_data = butter_lowpass_filter(
        np.array(pwm_data), cutoff_frequency, sampling_rate)
    axs[2, 1].clear()
    axs[2, 1].set_ylim([-0.2, 1.2])
    axs[2, 1].plot(t_values, filtered_data[start:end])
    axs[2, 1].set_title('Фильтрация')


ani = FuncAnimation(fig, update, frames=num_points, interval=time_interval)

plt.show()
