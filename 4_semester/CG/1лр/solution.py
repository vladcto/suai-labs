import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Button

def my_polinom(x):
    return 0.0005 * ( 0.0006 * (x ** 9) 
                     - 0.004 * (x ** 8) 
                     - 4 * (x ** 7) 
                     + (x ** 6) 
                     - 6 * (x ** 5) 
                     + 2 * (x ** 4) 
                     + 700 * (x ** 3) 
                     - 500 * (x ** 2) 
                     - x 
                     - 0.5)

# Catmull Row function
def catmull_equation(points,t):
    p1 = points[0]
    p2 = points[1]
    p3 = points[2]
    p4 = points[3]
    
    q1 = -t * ((1 - t) ** 2) * p1
    q2 = (2 - 5 * (t ** 2) + 3 * (t ** 3) ) * p2
    q3 = t * (1 + 4 * t - 3 * (t ** 2)) * p3
    q4 = -(t ** 2) * ( 1 - t) * p4 
    return 0.5 * (q1 + q2 + q3 + q4)

# Get points for splain 
def catmull_row(points, step = 0.05):
    res = []
    # copy one point to start and one to end
    points = np.vstack((points[0],points, points[-1]))
    # take 4 points
    for i in range( points.shape[0] - 3):
        points_now = points[i:i+4]
        for t in np.arange(0,1,step):
            res.append(catmull_equation(points_now, t))
    return np.array(res)

# Variant f(x)
x_f = np.linspace(-np.pi,np.pi,100)
y_f = 2 * np.sin(x_f) + 1.5 * np.sin(x_f * 2)

# Control points
x_s_p = np.linspace(-np.pi, np.pi, 8)

# Splain points
y_s_p = 2 * np.sin(x_s_p) + 1.5 * np.sin(x_s_p * 2)
splain = catmull_row(np.column_stack((x_s_p,y_s_p)))
x_splain = splain[:,0]
y_splain = splain[:,1]

# Polinom points
y_poli = np.asarray([my_polinom(x) for x in x_f])
poli_point_y = np.asarray([my_polinom(x) for x in x_s_p])
poli_points = catmull_row(np.column_stack([x_s_p,poli_point_y]))

# Draw graphics
plt.plot(x_f, y_f, "g--", label = "2sin(x) + 1.5sin(2x)")
plt.plot(x_s_p, y_s_p, "ro", label = "control points")
plt.plot(x_splain, y_splain, "r-", label = "splain")
plt.plot(x_f, y_poli, "b--", label = "polinom")
plt.plot(poli_points[:,0], poli_points[:,1], "b-", label = "polinom splain")
plt.plot(x_s_p, poli_point_y, "bo", label = "polinom control points")
plt.legend()
plt.show()