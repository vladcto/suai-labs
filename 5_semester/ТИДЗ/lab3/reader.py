from typing import List


def read_random_variables(path: str) -> List[float]:
    try:
        with open(path, 'r') as file:
            values = [float(value) for value in file.read().split()]
        return values
    except FileNotFoundError:
        print(f"Файл по пути {path} не найден.")
        return []
    except Exception as e:
        print(f"Произошла ошибка при чтении файла: {e}")
        return []
