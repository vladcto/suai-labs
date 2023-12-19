package lab3;

final public class PendulumModel {
    final double amplitude;
    final double dampingCoefficient;
    final double periodChangeRate;
    final double kTime;

    public PendulumModel(double amplitude, double dampingCoefficient, double periodChangeRate, double kTime) {
        this.amplitude = amplitude;
        this.dampingCoefficient = dampingCoefficient;
        this.periodChangeRate = periodChangeRate;
        this.kTime = kTime;
    }

    public PendulumModel copyWith(Double amplitude, Double dampingCoefficient, Double periodChangeRate, Double kTime) {
        return new PendulumModel(
                amplitude != null ? amplitude : this.amplitude,
                dampingCoefficient != null ? dampingCoefficient : this.dampingCoefficient,
                periodChangeRate != null ? periodChangeRate : this.periodChangeRate,
                kTime != null ? kTime : this.kTime
        );
    }
}
