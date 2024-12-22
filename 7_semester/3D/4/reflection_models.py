import numpy as np


def _lambert_reflection(normal, light_source):
    light_vector = np.array(light_source) / np.linalg.norm(light_source)
    normal_vector = np.array(normal) / np.linalg.norm(normal)
    dot = np.dot(normal_vector, light_vector)
    intensity = max(dot, 0)
    return (intensity, intensity, intensity)


def _torrance_sparrow_reflection(normal, light_source, viewer):
    light_vector = np.array(light_source) / np.linalg.norm(light_source)
    normal_vector = np.array(normal) / np.linalg.norm(normal)
    viewer_vector = np.array(viewer) / np.linalg.norm(viewer)

    roughness = 0.5
    f0 = 0.04

    half_vector = (light_vector + viewer_vector) / \
        np.linalg.norm(light_vector + viewer_vector)
    dot_l_n = max(np.dot(light_vector, normal_vector), 0)
    dot_v_n = max(np.dot(viewer_vector, normal_vector), 0)
    dot_h_n = max(np.dot(half_vector, normal_vector), 0)
    dot_h_v = max(np.dot(half_vector, viewer_vector), 0)

    F = f0 + (1 - f0) * (1 - dot_h_v) ** 5

    G = min(1, min((2 * dot_h_n * dot_v_n) / dot_h_v,
            (2 * dot_h_n * dot_l_n) / dot_h_v))

    alpha = roughness ** 2
    denom = (dot_h_n ** 2) * (alpha ** 2) + (1 - (dot_h_n) ** 2)
    D = alpha ** 2 / (np.pi * (denom ** 2))

    specular_intensity = (F * D * G) / (4 * dot_l_n * dot_v_n + 1e-7)
    diffuse_intensity = dot_l_n

    intensity = 0.1 + 0.9 * (diffuse_intensity + specular_intensity)
    intensity = min(intensity, 1)

    return (intensity, intensity, intensity)


def _phong_reflection(normal, light_source, viewer):
    light_vector = np.array(light_source) / np.linalg.norm(light_source)
    normal_vector = np.array(normal) / np.linalg.norm(normal)
    viewer_vector = np.array(viewer) / np.linalg.norm(viewer)

    ambient = 0.1
    diffuse_coefficient = 0.7
    specular_coefficient = 0.2
    shininess = 32

    ambient_color = ambient

    dot_l_n = max(np.dot(light_vector, normal_vector), 0)
    diffuse_color = diffuse_coefficient * dot_l_n

    reflection_vector = 2 * normal_vector * dot_l_n - light_vector
    dot_r_v = max(np.dot(reflection_vector, viewer_vector), 0)
    specular_color = specular_coefficient * (dot_r_v ** shininess)

    intensity = ambient_color + diffuse_color + specular_color
    intensity = min(intensity, 1)

    return (intensity, intensity, intensity)

def get_color(normal, light_source, viewer, model):
    if model == 'lambert':
        return _lambert_reflection(normal, light_source)
    elif model == 'phong':
        return _phong_reflection(normal, light_source, viewer)
    elif model == 'torrance-sparrow':
        return _torrance_sparrow_reflection(normal, light_source, viewer)