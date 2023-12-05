package lab4.animals;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import lab4.Point2;

public class Gull extends MovingAnimal {
    public Gull(Point2 startPosition, float speed) {
        super(startPosition, speed);
    }

    @NotNull
    @Override
    protected Point2 interpolatePoints(Point2 startPoint, Point2 endPoint, double t) {
        return super.interpolatePoints(startPoint, endPoint, Math.sqrt(t));
    }

    @Override
    protected Point2 handleTarget(Point2 target, @Nullable Point2 currentTarget) {
        if (target.y <= 0) {
            return null;
        }
        return target;
    }
}
