import variant as var
import my_math as mh
import matplotlib.pyplot as plt
import numpy as np

amplitude_spectrum = [mh.spectrum(x, var.fx, var.interval) for x in range(190)]
frequencies = np.arange(0, len(amplitude_spectrum))
plt.figure(figsize=(10, 6))
plt.plot(frequencies, amplitude_spectrum)
plt.title("Amplitude Spectrum")
plt.xlabel("Frequency")
plt.ylabel("Amplitude")
plt.grid(True)
plt.show()
