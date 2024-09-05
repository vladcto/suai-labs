import numpy as np

def DivideLayers(img):
    shape = (len(img), len(img[0]))
    Y = np.zeros(shape)
    Cr = np.zeros(shape)
    Cb = np.zeros(shape)
    for i in range(len(img)):
        for j in range(len(img[0])):
            Y[i][j] = img[i][j][0]
            Cr[i][j] = img[i][j][1]
            Cb[i][j] = img[i][j][2]
    return np.asarray((Y, Cr, Cb))

def RGB2YUV(rgb):
    m = np.array([[0.29900, -0.16874, 0.50000],
                  [0.58700, -0.33126, -0.41869],
                  [0.11400, 0.50000, -0.08131]])

    if len(rgb.shape) == 3:
        yuv = np.dot(rgb, m)
        yuv[:, :, 1:] += 128.0
    elif len(rgb.shape) == 2:
        if rgb.shape != (16, 16):
            return
        yuv = np.dot(rgb, m[:2, :2])
        yuv += 128.0
    else:
        return
    return yuv

def eight_by_eight(yuv):
    return np.asarray((yuv[:8, :8], yuv[:8, 8:], yuv[8:, :8], yuv[8:, 8:]))

def subsampling(Cr, Cb):
    for i in range(7, 0, -2):
        Cr = np.delete(Cr, i, 0)
        Cb = np.delete(Cb, i, 0)
    for j in range(7, 0, -2):
        Cr = np.delete(Cr, j, 1)
        Cb = np.delete(Cb, j, 1)
    return Cr, Cb

def quantizeDCTImage(dctImge, Q):
    N = dctImge.shape[0]
    blockN = Q.shape[0]
    qDctImge = np.zeros([N, N], dtype=int)
    for i in np.arange(0, N, 8):
        for j in np.arange(0, N, 8):
            qDctImge[i:(i + blockN), j:(j + blockN)] = (
                np.round(dctImge[i:(i + blockN), j:(j + blockN)] / Q))

    return qDctImge