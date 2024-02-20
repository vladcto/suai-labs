import random

class FishGenerator:
    def __init__(self, seed=None):
        self.A = [random.randint(0, 2**32 - 1) for _ in range(55)]
        self.B = [random.randint(0, 2**32 - 1) for _ in range(52)]
        self.index_A = 0
        self.index_B = 0
        random.seed(seed)

    def generate(self):
        while True:
            self.A[self.index_A] = (self.A[(self.index_A - 55) % 55] + self.A[(self.index_A - 24) % 55]) % (2**32)
            self.B[self.index_B] = (self.B[(self.index_B - 52) % 52] + self.B[(self.index_B - 19) % 52]) % (2**32)
            if self.B[self.index_B] & 1:
                yield self.A[self.index_A] / (2**32), self.B[self.index_B] / (2**32)
            self.index_A = (self.index_A + 1) % 55
            self.index_B = (self.index_B + 1) % 52