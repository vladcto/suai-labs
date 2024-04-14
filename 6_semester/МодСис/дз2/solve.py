PRECISION = 2


def TprIJ(Tob, LiJ, Ki, i):
    res = round(Tob * (1 + (LiJ / Ki)), PRECISION)
    print(f"Tpi_{i} = {Tob} * (1 + {LiJ}/{Ki}) = {res}")
    return res


def TpJ(a_matrix, TprIJ_matrix, i):
    coef = zip(a_matrix, TprIJ_matrix)
    print(f"Tпр_({i}) = ", end='')
    for a, t in coef:
        print(f"{a} * {t} + ", end='')
    res = round(sum(a * t for a, t in zip(a_matrix, TprIJ_matrix)), PRECISION)
    print(f"= {res}")
    return res


def lambdaJ(j, TprJ):
    return round(j / TprJ, PRECISION)


def LiJ(lambdaJ, ai, TprIJ, j, i):
    res = round(lambdaJ * ai * TprIJ, PRECISION)
    print(f"L{i}({j}) = {lambdaJ} * {ai} * {TprIJ} = {res}")
    return res


a_matrix4 = (0.25, 0.25, 0.25, 0.25)
Tob_matrix4 = (1, 0.7, 0.5, 0.4)
K_matrix4 = (2, 1, 1, 1)

a1, a2, a3, a4 = a_matrix4
Tob1, Tob2, Tob3, Tob4 = Tob_matrix4
k1, k2, k3, k4 = K_matrix4
l1, l2, l3, l4 = [0, 0, 0, 0]

lastLambda = 0
curLambda = 1
TpJ_val = 0

j = 1
while (lastLambda / curLambda < 0.9):
    print("Итерация", j)
    print("==========")

    TprIJ_matrix4 = [
        TprIJ(Tob1, l1, k1, 1),
        TprIJ(Tob2, l2, k2, 2),
        TprIJ(Tob3, l3, k3, 3),
        TprIJ(Tob4, l4, k4, 4),
    ]
    print()

    TpJ_val = TpJ(a_matrix4, TprIJ_matrix4, j)
    print()

    lastLambda = curLambda
    curLambda = lambdaJ(j, TpJ_val)
    print(
        f"λ{j-1}/λ{j} = {lastLambda}/{curLambda}={round(lastLambda / curLambda, PRECISION)}")
    print(f"λ{j} = {curLambda}")
    print()

    l1 = LiJ(curLambda, a1, TprIJ_matrix4[0], 1, j)
    l2 = LiJ(curLambda, a2, TprIJ_matrix4[1], 2, j)
    l3 = LiJ(curLambda, a3, TprIJ_matrix4[2], 3, j)
    l4 = LiJ(curLambda, a4, TprIJ_matrix4[3], 4, j)
    j += 1
    print()
    print()

print("ЗСеМО в состоянии насыщения.")
print(f"Число заявок M = {j - 1}")
print(f"Tпр – время пребывания в системе = {TpJ_val}")
print(f"λ - производительность системы = {curLambda}")
print("Средняя длина очереди для:")
print(f"L1 = {l1}")
print(f"L2 = {l2}")
print(f"L3 = {l3}")
print(f"L4 = {l4}")
