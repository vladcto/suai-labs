package lab3;

import javax.swing.*;

import java.awt.*;

public class PendulumSimulation extends JFrame {
    final PendulumManager manager = new PendulumManager(this);
    final JLabel resLabel = new JLabel();
    final JLabel time = new JLabel();
    final JLabel amplitudeLabel = new JLabel("Амплитуда");
    final JLabel dampingLabel = new JLabel("Коэффицент затухания");
    final JLabel periodChangeLabel = new JLabel("Скорость изменения периода");
    final JLabel timeLabel = new JLabel("Коэф. времени");

    final JSpinner amplitudeSpinner = new JSpinner(new SpinnerNumberModel(1, 0.2, 2, 0.2));
    final JSpinner dampingSpinner = new JSpinner(new SpinnerNumberModel(0.15, 0.01, 100, 0.01));
    final JSpinner periodChangeSpinner = new JSpinner(new SpinnerNumberModel(8D, 1D, 10D, 1D));
    final JSpinner timeSpinner = new JSpinner(new SpinnerNumberModel(1d, 0.1, 2, 0.1));

    final PendulumPanel pendulum = new PendulumPanel();
    final JButton forceLeftBtn = new JButton("Раскачать вправо");
    final JButton forceRightBtn = new JButton("Раскачать влево");

    public PendulumSimulation() {
        setLayout(null);
        setSize(350, 640);

        pendulum.setBounds(20, 0, 310, 250);
        add(pendulum);

        resLabel.setBounds(20, 369, 310, 49);
        add(resLabel);

        time.setBounds(210, 369, 120, 49);
        add(time);

        forceLeftBtn.setBounds(20, 300, 155, 49);
        forceLeftBtn.addActionListener((x) -> manager.applyForce(PendulumManager.ForceSide.LEFT));
        add(forceLeftBtn);

        forceRightBtn.setBounds(175, 300, 155, 49);
        forceRightBtn.addActionListener((x) -> manager.applyForce(PendulumManager.ForceSide.RIGHT));
        add(forceRightBtn);

        // Change model labels
        amplitudeLabel.setBounds(31, 431, 133, 40);
        add(amplitudeLabel);
        amplitudeSpinner.addChangeListener((x) -> {
            manager.setAmplitude((double) amplitudeSpinner.getValue());
        });
        amplitudeSpinner.setBounds(31, 471, 133, 20);
        add(amplitudeSpinner);

        dampingLabel.setBounds(186, 431, 133, 40);
        add(dampingLabel);
        dampingSpinner.addChangeListener((x) -> {
            manager.setDampingCoefficient((double) dampingSpinner.getValue());
        });
        dampingSpinner.setBounds(186, 471, 133, 20);
        add(dampingSpinner);

        periodChangeLabel.setBounds(31, 504, 133, 40);
        add(periodChangeLabel);
        periodChangeSpinner.addChangeListener((x) -> {
            manager.setPeriodChangeRate((double) periodChangeSpinner.getValue());
        });
        periodChangeSpinner.setBounds(31, 544, 133, 20);
        add(periodChangeSpinner);

        timeLabel.setBounds(186, 504, 133, 40);
        add(timeLabel);
        timeSpinner.addChangeListener((x) -> {
            manager.setTime((double) timeSpinner.getValue());
        });
        timeSpinner.setBounds(186, 544, 133, 20);
        add(timeSpinner);

        manager.start();
    }

    private void showSimulationResult() {
        final var resModel = manager.getResult();
        final var cords = resModel.getPendulumPoint();
        resLabel.setText(String.format("x: %.4f y: %.4f", cords.x, cords.y));
        pendulum.setPendulumAngle(resModel.angle);
        time.setText(String.valueOf(resModel.msPassed));
    }

    public void update() {
        showSimulationResult();
    }

    private static class PendulumPanel extends JPanel {
        private double pendulumAngle;

        public void setPendulumAngle(double pendulumAngle) {
            this.pendulumAngle = pendulumAngle;
            repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            drawPendulum(g, getWidth() >> 1, getHeight() >> 1, pendulumAngle);
        }

        private void drawPendulum(Graphics g, double centerX, double centerY, double pendulumAngle) {
            g.drawLine((int) centerX, (int) centerY, (int) centerX, (int) (centerY + 100));

            double pendulumLength = 100;
            double positionX = centerX + pendulumLength * Math.sin(pendulumAngle);
            double positionY = centerY + pendulumLength * Math.cos(pendulumAngle);
            g.drawLine((int) centerX, (int) centerY, (int) positionX, (int) positionY);

            g.fillOval((int) positionX - 5, (int) positionY - 5, 10, 10);
        }
    }

    public static void main(String[] args) {
        PendulumSimulation pendulumSimulation = new PendulumSimulation();
        pendulumSimulation.setVisible(true);
    }
}
