from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
from model_export import *
from reflection_models import *
import numpy as np
import json

window_width = 1020
window_height = 820


def read_json_file(json_filename):
    with open(json_filename, 'r') as file:
        data = json.load(file)
    return data['name'], data


def read_depth_map(depth_map_filename):
    with open(depth_map_filename, 'rb') as file:
        height = int(np.fromfile(file, dtype=np.float64, count=1)[0])
        width = int(np.fromfile(file, dtype=np.float64, count=1)[0])
        depth_map_array = np.fromfile(
            file, dtype=np.float64).reshape((height, width))
    return depth_map_array


def calculate_normal(p1, p2, p3):
    u = np.array(p2) - np.array(p1)
    v = np.array(p3) - np.array(p1)
    return np.cross(u, v)

def display(depth_map_array, light_position, viewer_position, reflection_model):
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()

    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()

    gluLookAt(viewer_position[0], viewer_position[1], viewer_position[2],
              0, 0, 0,
              0, 1, 0)

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

                normal = calculate_normal(
                    vertices[0], vertices[1], vertices[2])
                color = get_color(normal, light_position,
                                  viewer_position, reflection_model)

                glColor3f(*color)
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


# Read map
json_filename = 'depth_map_info.json'
depth_map_filename, config = read_json_file(json_filename)
depth_map_array = read_depth_map(depth_map_filename)

# Export map
export_format = config.get('export_format', 'obj')
output_filename = config.get('export_name', 'output')
export_depth_map_to_file(depth_map_array, export_format, output_filename)

# Show object
light_position = config['light_source']['position']
viewer_position = config['viewer']['position']
reflection_model = config.get('reflection_model', 'phong')

init_glut(
    lambda: display(
        depth_map_array,
        light_position,
        viewer_position,
        reflection_model
    )
)
glutMainLoop()
