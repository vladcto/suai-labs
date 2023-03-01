import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Button

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
y_s_p = 2 * np.sin(x_s_p) + 1.5 * np.sin(x_s_p * 2)

# Splain points
splain = catmull_row(np.column_stack((x_s_p,y_s_p)))
x_splain = splain[:,0]
y_splain = splain[:,1]

# example of draw buttons
# Draw buttons
# bnext = Button(plt.axes([0.7, 0.05, 0.1, 0.075]), 'Next')
# bnext.on_clicked(lambda x: print("amogus"))

# Draw graphics
plt.plot(x_f, y_f, "g--", label = "2sin(x) + 1.5sin(2x)")
plt.plot(x_s_p, y_s_p, "ro", label = "control points")
plt.plot(x_splain, y_splain, "r-", label = "splain")
plt.legend()
plt.show()