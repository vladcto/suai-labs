package lab3;

import javax.swing.Timer;

public class PendulumManager {
    PendulumModel model = new PendulumModel(
            1F,
            0.15,
            8,
            1
    );

    final PendulumSimulation simulation;

    public PendulumManager(PendulumSimulation simulation) {
        this.simulation = simulation;
    }

    public void start() {
        final var timer = new Timer(32, (x) -> simulation.update());
        timer.setRepeats(true);
        timer.start();
    }

    long startedTimeMs = -1;
    int forceDirection = 1;

    public void setAmplitude(double amplitude) {
        this.model = model.copyWith(amplitude, null, null, null);
        simulation.update();
    }

    public void setDampingCoefficient(double dampingCoefficient) {
        this.model = model.copyWith(null, dampingCoefficient, null, null);
        simulation.update();
    }


    public void setPeriodChangeRate(double periodChangeRate) {
        this.model = model.copyWith(null, null, periodChangeRate, null);
        simulation.update();
    }

    public void setTime(double time) {
        this.model = model.copyWith(null, null, null, time);
        simulation.update();
    }


    public enum ForceSide {LEFT, RIGHT}

    public void applyForce(ForceSide side) {
        startedTimeMs = System.currentTimeMillis();
        if (side == ForceSide.RIGHT) {
            forceDirection = 1;
        } else {
            forceDirection = -1;
        }
        simulation.update();
    }

    public PendulumSimulationResult getResult() {
        final var estimatedTime = System.currentTimeMillis() - startedTimeMs;
        return new PendulumSimulationResult(model, estimatedTime, forceDirection);
    }
}
