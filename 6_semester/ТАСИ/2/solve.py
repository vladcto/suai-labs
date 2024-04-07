import numpy as np
from typing import Tuple
import random
from PIL import Image


def create_random_image():
    width, height = 16, 16
    image = Image.new("RGB", (width, height))
    pixels = image.load()

    for i in range(width):
        for j in range(height):
            r = random.randint(0, 10) + 150
            g = random.randint(0, 10) + 120
            b = random.randint(0, 30) + 200
            pixels[i, j] = (r, g, b)

    return image


def rgb_to_ycrcb(r: int, g: int, b: int) -> Tuple[int, int, int]:
    matrix = np.array(
        [
            [0, 0.299, 0.587, 0.114],
            [128, -0.168736, -0.331264, 0.5],
            [128, 0.5, -0.418688, -0.081312],
        ]
    )
    y, cb, cr = matrix @ np.array([1, r, g, b])
    return (y, cb, cr)


def convert_image_to_ycrcb(image: Image.Image):
    width, height = image.size
    pixels = np.array([[(0,0,0) for _ in range(width)] for _ in range(height)])

    for i in range(width):
        for j in range(height):
            r, g, b = image.getpixel((i, j))
            y, cr, cb = rgb_to_ycrcb(r, g, b)
            pixels[i][j] = (y, cr, cb)

    return pixels


def split_image_to_blocks(image: np.ndarray, block_size: int) -> np.ndarray:
    height, width = image.shape
    blocks = []

    for i in range(0, height, block_size):
        for j in range(0, width, block_size):
            block = image[i:i + block_size, j:j + block_size]
            blocks.append(block)

    return np.array(blocks)


def convert_image_to_blocks(ycrcb_image: np.ndarray) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    y = ycrcb_image[:, :, 0]
    cr = ycrcb_image[:, :, 1]
    cb = ycrcb_image[:, :, 2]

    block_size = 8
    y_blocks = split_image_to_blocks(y, block_size)
    cr_blocks = split_image_to_blocks(cr, block_size)
    cb_blocks = split_image_to_blocks(cb, block_size)

    downsampled_cr_blocks, downsampled_cb_blocks = downsample_chroma_components(
        cr_blocks, cb_blocks)

    return y_blocks, downsampled_cr_blocks, downsampled_cb_blocks


def downsample_chroma_components(cr_blocks: np.ndarray, cb_blocks: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    downsampled_cr_blocks = cr_blocks[::2, ::2]
    downsampled_cb_blocks = cb_blocks[::2, ::2]

    return downsampled_cr_blocks, downsampled_cb_blocks


image = create_random_image()
# image.show()
ycrcb_image = np.array(convert_image_to_ycrcb(image))
y_blocks, cr_blocks, cb_blocks = convert_image_to_blocks(ycrcb_image)
print(y_blocks)