import copy
import time
from scipy import signal
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from collections import deque
from rayleigh_fading_signal import RayleighFadingSignal

noise = RayleighFadingSignal(amplitude=0.1, noise_std=0.5)


def st(t: float) -> float:
    return 2 * np.sin(t)+ noise.rayleigh_fading()


def quantize_signal(value: float, num_bits=3) -> float:
    min_value = -2.0
    max_value = 2.0
    num_levels = 2**num_bits
    quantization_step = (max_value - min_value) / num_levels
    quantized_value = round((value - min_value) /
                            quantization_step) * quantization_step + min_value

    return quantized_value


def butter_lowpass_filter(signal_values: np.ndarray, cutoff_frequency: float, sampling_rate: float) -> np.ndarray:
    # Нормализация частоты среза
    nyquist = 0.5 * sampling_rate
    normal_cutoff = cutoff_frequency / nyquist

    # Проектирование фильтра Баттерворда
    b, a = signal.butter(4, normal_cutoff, btype='low', analog=False)

    # Применение фильтра к сигналу
    filtered_signal = signal.filtfilt(b, a, signal_values)

    return filtered_signal


def pwm_signal(value):
    return 1 if value > 0 else 0


# Parameters
num_points = 250
t_values = np.linspace(0, 10, num_points)
cutoff_frequency = 0.5
sampling_rate = 10

# Create a figure and axis
fig, axs = plt.subplots(2, 2, figsize=(10, 8))

# Initialize empty lists to store data for each plot
original_data = [0 for _ in range(num_points)]
quantized_data = copy.copy(original_data)
filtered_data = copy.copy(original_data)
pwm_data = copy.copy(original_data)

# Update function for animation
def update(frame):
    t = time.time()

    # 1) Original Signal
    original_value = st(t)
    original_data.pop(0)
    original_data.append(original_value)
    axs[0, 0].clear()
    axs[0, 0].set_ylim([-2.2, 2.2])
    axs[0, 0].plot(t_values[:150], original_data[50:200])
    axs[0, 0].set_title('Original Signal')
    axs[0, 0].legend()

    # 2) Quantization
    quantized_value = quantize_signal(original_value)
    quantized_data.pop(0)
    quantized_data.append(quantized_value)
    axs[0, 1].clear()
    axs[0, 1].set_ylim([-2.2, 2.2])
    axs[0, 1].plot(t_values[:150], quantized_data[50:200])
    axs[0, 1].set_title('Quantization')
    axs[0, 1].legend()

    # 3) Filtration
    filtered_data = butter_lowpass_filter(np.array(quantized_data), cutoff_frequency, sampling_rate)
    axs[1, 0].clear()
    axs[1, 0].set_ylim([-2.2, 2.2])
    axs[1, 0].plot(t_values[:150], filtered_data[50:200])
    axs[1, 0].set_title('Filtration')
    axs[1, 0].legend()

    # 4) PWM
    pwm_data = [pwm_signal(x) for x in filtered_data]
    axs[1, 1].clear()
    axs[1, 1].set_ylim([-0.1, 1.1])
    axs[1, 1].plot(t_values[:150], pwm_data[50:200])
    axs[1, 1].set_title('PWM')
    axs[1, 1].legend()

# Create the animation
ani = FuncAnimation(fig, update, frames=num_points, interval=32)

# Show the plot
plt.show()