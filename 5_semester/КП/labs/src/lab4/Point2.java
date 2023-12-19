package lab4;

public class Point2 {
    public final double x;
    public final double y;

    public Point2(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Point2 distance(Point2 end) {
        return new Point2(end.x - x, end.y - y);
    }

    public float getLength() {
        return (float) Math.sqrt(y * y + x * x);
    }

    public Point2 scale(double scale) {
        return new Point2(x * scale, y * scale);
    }

    public Point2 add(Point2 a) {
        return new Point2(x + a.x, y + a.y);
    }
}
