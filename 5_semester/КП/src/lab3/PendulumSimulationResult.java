package lab3;

public class PendulumSimulationResult {
    final public float msPassed;
    final public double angle;

    public PendulumSimulationResult(PendulumModel model, long msPassed, int directionForce) {
        angle = simulatePendulum(
                model,
                msPassed,
                directionForce
        );
        this.msPassed = msPassed;
    }

    public static double simulatePendulum(PendulumModel model, long totalTimeMillis, int direction) {
        totalTimeMillis *= model.kTime;
        final var amplitude = model.amplitude;
        final var dampingCoefficient = model.dampingCoefficient;
        final var periodChangeRate = model.periodChangeRate;

        float totalTimeSeconds = totalTimeMillis / 1000.0f;


        return amplitude * (float) Math.exp(-dampingCoefficient * totalTimeSeconds)
                * (float) Math.cos(9 * (1 / periodChangeRate) * totalTimeSeconds + direction * Math.PI / 2.0f);

    }

    public Point getPendulumPoint() {
        double xCoordinate = Math.sin(this.angle) * 10;
        double yCoordinate = Math.cos(this.angle) * 10;

        return new Point(xCoordinate, yCoordinate);
    }
}
