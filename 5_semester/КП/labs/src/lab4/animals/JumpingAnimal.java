package lab4.animals;

import org.jetbrains.annotations.Nullable;

import lab4.Point2;

abstract public class JumpingAnimal extends MovingAnimal {
    protected final double jumpHeight;

    protected JumpingAnimal(Point2 startPosition, float speed, double jumpHeight) {
        super(startPosition, speed);
        this.jumpHeight = jumpHeight;
    }

    @Override
    protected final Point2 handleTarget(Point2 target, @Nullable Point2 currentTarget) {
        if (target.y < 0 || currentTarget != null) {
            return null;
        }
        return new Point2(target.x, 0);
    }
}
