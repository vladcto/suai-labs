def print_map(map):
    for key in sorted(map):
        print(f"{key} = {round(map[key],2)}")


def calculate_system_metrics(lmbda, mu):
    rho = lmbda / mu

    L_queue = rho * rho / (1 - rho)
    T_queue = L_queue / lmbda

    L_service = rho
    T_service = rho / lmbda

    return {
        'rho': rho,
        'L_queue': L_queue,
        'T_queue': T_queue,
        'L_service': L_service,
        'T_service': T_service,
        'L_system': L_queue + L_service,
        'T_system': T_queue + T_service,
    }


ab = calculate_system_metrics(9+6, 18)
a = calculate_system_metrics(9, 18)
b = calculate_system_metrics(6, 18)

print_map(ab)
print()
sum_ab = {key: (a[key] + b[key])/2 for key in set(a) & set(b)}
print_map(sum_ab)
