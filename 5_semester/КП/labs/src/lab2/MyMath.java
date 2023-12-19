package lab2;

public final class MyMath {
    private MyMath() {
    }

    static double _macloren(double x, int n) {
        return Math.pow(-1, n) * Math.pow(x, 2 * n + 1) / (2 * n + 1);
    }

    public static double calculateFunctionValue(double x, double precision) {
        double result = 0;
        int n = 0;
        double term = Double.POSITIVE_INFINITY;

        while (Math.abs(term) > precision) {
            term = _macloren(x, n);
            result += term;
            n++;
        }

        return result;
    }
}
