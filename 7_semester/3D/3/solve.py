from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import numpy as np
import json

window_width = 1020
window_height = 820


def read_json_file(json_filename):
    with open(json_filename, 'r') as file:
        data = json.load(file)
    return data['name']


def read_depth_map(depth_map_filename):
    with open(depth_map_filename, 'rb') as file:
        height = int(np.fromfile(file, dtype=np.float64, count=1)[0])
        width = int(np.fromfile(file, dtype=np.float64, count=1)[0])
        depth_map_array = np.fromfile(
            file, dtype=np.float64).reshape((height, width))
    return depth_map_array


def export_to_obj(filename, depth_map_array):
    height, width = depth_map_array.shape
    vertices = []
    indices = {}

    with open(filename, 'w') as file:
        vertex_id = 1
        for i in range(height):
            for j in range(width):
                depth = depth_map_array[i, j]
                if depth != 0:
                    vertex = (j - width / 2, height / 2 - i, -depth)
                    indices[(i, j)] = vertex_id
                    vertices.append(vertex)
                    file.write(f'v {vertex[0]} {vertex[1]} {vertex[2]}\n')
                    vertex_id += 1

        for i in range(height - 1):
            for j in range(width - 1):
                if (depth_map_array[i, j] != 0 and
                    depth_map_array[i, j + 1] != 0 and
                    depth_map_array[i + 1, j] != 0 and
                        depth_map_array[i + 1, j + 1] != 0):

                    v1 = indices[(i, j)]
                    v2 = indices[(i, j + 1)]
                    v3 = indices[(i + 1, j + 1)]
                    v4 = indices[(i + 1, j)]

                    file.write(f"l {v1} {v2}\n")
                    file.write(f"l {v2} {v3}\n")
                    file.write(f"l {v3} {v4}\n")
                    file.write(f"l {v4} {v1}\n")

                    file.write(f"f {v1} {v2} {v3} {v4}\n")


def display(depth_map_array):
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()

    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()

    # -500 as a crutch so not to deal with positioning
    gluLookAt(
        0, 0, -500,
        0, 0, 0,
        0, 1, 0,
    )

    height, width = depth_map_array.shape
    max_depth = np.max(depth_map_array) if np.max(depth_map_array) != 0 else 1
    scale_factor = 200

    glBegin(GL_QUADS)
    for i in range(height - 1):
        for j in range(width - 1):
            if (depth_map_array[i, j] != 0 and
                depth_map_array[i, j + 1] != 0 and
                depth_map_array[i + 1, j] != 0 and
                    depth_map_array[i + 1, j + 1] != 0):

                vertices = [
                    ((j - width / 2) / width, (height / 2 - i) /
                     height, -depth_map_array[i, j] / max_depth),
                    (((j + 1) - width / 2) / width, (height / 2 - i) /
                     height, -depth_map_array[i, j + 1] / max_depth),
                    (((j + 1) - width / 2) / width, (height / 2 - (i + 1)) /
                     height, -depth_map_array[i + 1, j + 1] / max_depth),
                    ((j - width / 2) / width, (height / 2 - (i + 1)) /
                     height, -depth_map_array[i + 1, j] / max_depth)
                ]

                for vertex in vertices:
                    glVertex3f(vertex[0] * scale_factor, vertex[1]
                               * scale_factor, vertex[2] * scale_factor)
    glEnd()

    glutSwapBuffers()


def init_glut(display_func):
    glutInit()
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH)
    glutInitWindowSize(window_width, window_height)
    glutInitWindowPosition(100, 100)
    glutCreateWindow(b"3D Depth Map Visualization")
    glutDisplayFunc(display_func)
    glEnable(GL_DEPTH_TEST)
    glClearColor(0.0, 0.0, 0.0, 0.0)

    glMatrixMode(GL_PROJECTION)
    gluPerspective(45, (window_width / window_height), 0.1, 1000.0)
    glMatrixMode(GL_MODELVIEW)

    glPointSize(2.0)


json_filename = 'depth_map_info.json'
depth_map_filename = read_json_file(json_filename)
depth_map_array = read_depth_map(depth_map_filename)

export_to_obj('output.obj', depth_map_array)

init_glut(lambda: display(depth_map_array))
glutMainLoop()
