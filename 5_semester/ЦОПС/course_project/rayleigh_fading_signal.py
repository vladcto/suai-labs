import numpy as np


class RayleighFadingSignal:
    def __init__(self, amplitude=1.0, noise_std=0.3):
        self.amplitude = amplitude
        self.noise_std = noise_std

    def rayleigh_fading(self) -> float:
                # Генерация Рэлеевских замираний
        fading = self.amplitude * (np.random.randn() + 1j * np.random.randn())

        # Генерация аддитивного белого гауссовского шума
        noise = self.noise_std * (np.random.randn() + 1j * np.random.randn())

        return fading + noise