package lab4.animals;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.LinkedList;
import java.util.Queue;

import lab4.Point2;

public abstract class MovingAnimal {
    private final Queue<Point2> targets = new LinkedList<>();
    private long startTime = 0;
    private Point2 lastPosition;
    private final float speedMs;

    protected MovingAnimal(Point2 startPosition, float speed) {
        lastPosition = startPosition;
        this.speedMs = speed;
    }


    public final void moveTo(Point2 globalTarget) {
        final var newTarget = handleTarget(globalTarget, targets.peek());
        if (newTarget != null) {
            if (targets.isEmpty()) {
                startTime = System.currentTimeMillis();
            }
            targets.add(newTarget);
        }
    }

    public final Point2 getPosition() {
        var target = targets.peek();
        if (target == null) {
            return lastPosition;
        }

        var distance = lastPosition.distance(target);
        var moveTime = distance.getLength() / speedMs;
        if (moveTime == 0) {
            lastPosition = targets.remove();
            return lastPosition;
        }
        var t = (System.currentTimeMillis() - startTime) / moveTime;

        if (t >= 1) {
            lastPosition = targets.remove();
            startTime += (long) moveTime;
            return getPosition();
        }
        return interpolatePoints(lastPosition, target, t);
    }

    @NotNull
    protected Point2 interpolatePoints(Point2 startPoint, Point2 endPoint, double t) {
        return startPoint.scale(1 - t).add(endPoint.scale(t));
    }

    @Nullable
    protected abstract Point2 handleTarget(Point2 target, @Nullable Point2 currentTarget);
}