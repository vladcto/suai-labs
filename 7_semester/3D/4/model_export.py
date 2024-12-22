import numpy as np


def _calculate_normal(p1, p2, p3):
    u = np.array(p2) - np.array(p1)
    v = np.array(p3) - np.array(p1)
    return np.cross(u, v)

def _export_to_obj(filename, depth_map_array):
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


def _export_to_stl(filename, depth_map_array):
    # TODO: extract open file in new method
    height, width = depth_map_array.shape
    with open(filename, 'w') as file:
        file.write('solid depth_map\n')
        for i in range(height - 1):
            for j in range(width - 1):
                if (depth_map_array[i, j] != 0 and
                    depth_map_array[i, j + 1] != 0 and
                    depth_map_array[i + 1, j] != 0 and
                        depth_map_array[i + 1, j + 1] != 0):

                    vertices = [
                        [j - width / 2, height / 2 - i, -depth_map_array[i, j]],
                        [j + 1 - width / 2, height / 2 -
                            i, -depth_map_array[i, j + 1]],
                        [j + 1 - width / 2, height / 2 -
                            (i + 1), -depth_map_array[i + 1, j + 1]],
                        [j - width / 2, height / 2 -
                            (i + 1), -depth_map_array[i + 1, j]]
                    ]

                    for k in range(2):
                        triangle = (
                            vertices[0], vertices[k + 1], vertices[k + 2])
                        normal = _calculate_normal(*triangle)
                        normal_string = ' '.join(map(str, normal))
                        file.write(f'facet normal {normal_string}\n')
                        file.write('  outer loop\n')
                        for vertex in triangle:
                            vertex_string = ' '.join(map(str, vertex))
                            file.write(f'    vertex {vertex_string}\n')
                        file.write('  endloop\n')
                        file.write('endfacet\n')
        file.write('endsolid depth_map\n')


def _export_to_ply(filename, depth_map_array):
    height, width = depth_map_array.shape
    vertices = []
    indices = {}
    faces = []

    for i in range(height):
        for j in range(width):
            depth = depth_map_array[i, j]
            if depth != 0:
                vertex = (j - width / 2, height / 2 - i, -depth)
                indices[(i, j)] = len(vertices)
                vertices.append(vertex)

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

                faces.append((v1, v2, v3, v4))

    with open(filename, 'w') as file:
        file.write("ply\n")
        file.write("format ascii 1.0\n")
        file.write(f"element vertex {len(vertices)}\n")
        file.write("property float x\n")
        file.write("property float y\n")
        file.write("property float z\n")
        file.write(f"element face {len(faces)}\n")
        file.write("property list uchar int vertex_index\n")
        file.write("end_header\n")

        for vertex in vertices:
            file.write(f"{vertex[0]} {vertex[1]} {vertex[2]}\n")

        for face in faces:
            file.write(f"4 {face[0]} {face[1]} {face[2]} {face[3]}\n")


def export_depth_map_to_file(depth_map_array, export_format, output_filename):
    output_path = f"{output_filename}.{export_format}"

    if export_format == 'obj':
        _export_to_obj(output_path, depth_map_array)
    elif export_format == 'stl':
        _export_to_stl(output_path, depth_map_array)
    elif export_format == 'ply':
        _export_to_ply(output_path, depth_map_array)
