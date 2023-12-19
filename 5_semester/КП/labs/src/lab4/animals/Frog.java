package lab4.animals;

import org.jetbrains.annotations.NotNull;

import lab4.Point2;

public class Frog extends JumpingAnimal {
    public Frog(Point2 startPosition, float speed, double jumpHeight) {
        super(startPosition, speed, jumpHeight);
    }

    @Override
    @NotNull
    protected Point2 interpolatePoints(Point2 startPoint, Point2 endPoint, double t) {
        final var tx = tx(t);
        final var ty = Math.abs((Math.sin(3 * t * Math.PI))) * jumpHeight;
        return new Point2(super.interpolatePoints(startPoint, endPoint, tx).x, ty);
    }

    private double tx(double t) {
        final var d3 = 1 / 3d;
        final var start = ((int) (t / d3)) * d3;
        return start + Math.sqrt(t / d3 % 1) * d3;
    }
}
