package lab4.animals;

import org.jetbrains.annotations.NotNull;

import lab4.Point2;

public class Rat extends MovingAnimal {
    public Rat(Point2 startPosition, float speed) {
        super(startPosition, speed);
    }

    @NotNull
    @Override
    protected Point2 interpolatePoints(Point2 startPoint, Point2 endPoint, double t) {
        return super.interpolatePoints(startPoint, endPoint, t);
    }

    @Override
    protected Point2 handleTarget(Point2 inputTarget, Point2 currentTarget) {
        if (inputTarget.y > 0) {
            return null;
        }
        return inputTarget;
    }
}
