from math import sin
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Button, Slider


# Return y of polinom(x)
def my_polinom(x):
    return 0.0005 * ((x ** 9)
                     + 0.5 * (x ** 8)
                     - 23.79 * (x ** 7)
                     - 5.685 * (x ** 6)
                     - 133.275 * (x ** 5)
                     - 40.485 * (x ** 4)
                     - 1400 * (x ** 3)
                     - 56000 * (x ** 2)
                     + 290000 * x
                     - 10)


# Catmull Row function
def bezie_equation(points, t):
    p1 = points[0]
    p2 = points[1]
    p3 = points[2]
    p4 = points[3]
    q1 = ((1 - t) * p1 + 3 * t * p2) * (1 - t) + 3 * (t ** 2) * p3
    return q1 * (1 - t) + (t ** 3) * p4


# Get points for Bezie curve
def bezie_curve(points, step=0.01):
    res = []
    i = 0
    while i < points.shape[0]:
        if i == 0:
            points_now = np.vstack(
                [points[i: 3],
                 (points[2] + points[3])/2]
            )
            i += 3
        elif i + 2 >= points.shape[0]:
            points_now = np.vstack(
                [(points[i] + points[i-1])/2, points[i:],
                 *[points[-1] for _ in range(3)]]
            )
            i += 2
        else:
            points_now = np.vstack(
                [(points[i] + points[i-1])/2,
                 points[i : i + 2],
                 (points[i+1] + points[i+2])/2]
            )
            i += 2

        for t in np.arange(0, 1, step):
            res.append(bezie_equation(points_now, t))
    return np.array(res)


def update_plot(state, fig):
    fig.clear()
    # Control points for spline and other curves.
    x_points = np.linspace(0, 2 * np.pi, 100)
    x_controls = np.linspace(0, 2 * np.pi, state["points"])
    y_controls = 2 * np.sin(x_controls) + 1.5 * np.sin(x_controls * 2)
    label_text = ""

    if (state["poly"]):
        # Polinom points
        poli_y = np.asarray([my_polinom(x) for x in x_points])
        poli_controls_y = np.asarray([my_polinom(x) for x in x_controls])
        poli_points = bezie_curve(
            np.column_stack([x_controls, poli_controls_y]))

        fig.plot(x_points, poli_y, "b--", label="polinom")
        fig.plot(poli_points[:, 0], poli_points[:, 1],
                 "b-", label="polinom spline")
        fig.plot(x_controls, poli_controls_y, "bo",
                 label="polinom control points")
        # Calculate error
        y_predict = np.asarray([my_polinom(x) for x in poli_points[:, 0]])
        error_dif = np.abs(poli_points[:, 1] - y_predict).mean()
        label_text += f"Epl = {round(error_dif,4)} "

    if (state["catmull"]):
        # Spline points
        splain = bezie_curve(np.column_stack((x_controls, y_controls)))
        x_splain = splain[:, 0]
        y_splain = splain[:, 1]

        fig.plot(x_splain, y_splain, "r-", label="spline")
        # Calculate error
        y_predict = np.asarray(
            [2 * sin(x) + 1.5*sin(2 * x) for x in x_splain])
        error_dif = np.abs(y_splain - y_predict).mean()
        label_text += f"Esp = {round(error_dif,4)} "

    if (state["fx"]):
        y_f = 2 * np.sin(x_points) + 1.5 * np.sin(x_points * 2)

        fig.plot(x_points, y_f, "g--", label="2sin(x) + 1.5sin(2x)")
        fig.plot(x_controls, y_controls, "ro--", label="spline control points")

    handles, labels = fig.get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    fig.legend(by_label.values(), by_label.keys())
    fig.set_title(label_text)
    plt.draw()


def draw_polinom(state, fig):
    state["poly"] = True
    update_plot(state, fig)


def draw_spline(state, fig):
    state["catmull"] = True
    update_plot(state, fig)


def draw_function(state, fig):
    state["fx"] = True
    update_plot(state, fig)


def clear(state, fig):
    state["fx"] = False
    state["catmull"] = False
    state["poly"] = False
    update_plot(state, fig)


def change_control_points(state, fig, num):
    state["points"] = int(num)
    update_plot(state, fig)


# Draw graphics
fig, ax = plt.subplots()
my_state = {"fx": False, "catmull": False, "poly": False, "points": 4}
fig.subplots_adjust(bottom=0.3)
fig.subplots_adjust(right=0.85)

# Buttons and slider
ax_poli_btn = fig.add_axes([0.2, 0.05, 0.2, 0.2])
poli_btn = Button(ax_poli_btn, "Show poly.")
poli_btn.on_clicked(lambda _: draw_polinom(my_state, ax))

ax_fx_btn = fig.add_axes([0.4, 0.05, 0.2, 0.2])
fx_btn = Button(ax_fx_btn, "Show fx")
fx_btn.on_clicked(lambda _: draw_function(my_state, ax))

ax_splain_btn = fig.add_axes([0.6, 0.05, 0.2, 0.2])
splain_btn = Button(ax_splain_btn, "Show spline")
splain_btn.on_clicked(lambda _: draw_spline(my_state, ax))

ax_clear_btn = fig.add_axes([0.11, 0.11, 0.08, 0.08])
clear_btn = Button(ax_clear_btn, "x")
clear_btn.on_clicked(lambda _: clear(my_state, ax))

ax_slider = fig.add_axes([0.9, 0.1, 0.05, 0.8])
slider = Slider(ax_slider,
                valmin=4,
                valmax=100,
                orientation="vertical",
                label="points",
                valstep=1)
slider.on_changed(lambda num: change_control_points(my_state, ax, num))
plt.show()
