package lab4;

import javax.swing.*;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import lab4.animals.Frog;
import lab4.animals.Gull;
import lab4.animals.MovingAnimal;
import lab4.animals.Rat;

class MovingAnimalPanel extends JPanel {
    private List<MovingAnimal> animals = new ArrayList<>();

    public MovingAnimalPanel() {

        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int localX = e.getX();
                int localY = e.getY();
                float globalX = (float) localX / getWidth();
                float globalY = (float) (1 - 2.0 * localY / getHeight());
                Point2 target = new Point2(globalX, globalY);
                animals.forEach((x) -> {
                    x.moveTo(target);
                });
                repaint();
            }
        });
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        animals.forEach((movingAnimal -> {
            Point2 currentPosition = movingAnimal.getPosition();
            g.setColor(Color.RED);
            int x = (int) (currentPosition.x * getWidth());
            int y = (int) ((1 - currentPosition.y) * getHeight() / 2);
            g.fillOval(x - 10, y - 10, 20, 20);
        }));
        g.setColor(Color.black);
        g.drawLine(0, getHeight() / 2, getWidth(), getHeight() / 2);
    }

    public void addAnimal(MovingAnimal animal) {
        animals.add(animal);
    }
}

class MovingAnimalFrame extends JFrame {
    MovingAnimalPanel panel;
    JButton frogButton = new JButton("+Лягуха");
    JButton ratButton = new JButton("+Крыса");
    JButton gullButton = new JButton("+Грач");

    public MovingAnimalFrame() {
        setLayout(null);
        setSize(400, 400);

        panel = new MovingAnimalPanel();
        panel.setBounds(0, 100, getWidth(), getHeight() - 125);
        add(panel);
        // Buttons
        frogButton.setBounds(0, 0, getWidth() / 3, 100);
        frogButton.addActionListener((x) -> panel.addAnimal(Generator.generateFrog()));
        add(frogButton);

        ratButton.setBounds(getWidth() / 3, 0, getWidth() / 3, 100);
        ratButton.addActionListener((x) -> panel.addAnimal(Generator.generateRat()));
        add(ratButton);

        gullButton.setBounds(getWidth() / 3 * 2, 0, getWidth() / 3, 100);
        gullButton.addActionListener((x) -> panel.addAnimal(Generator.generateGull()));
        add(gullButton);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        setLocationRelativeTo(null);
        setVisible(true);
    }

    public void repaintPanel() {
        panel.setBounds(0, 100, getWidth(), getHeight() - 125);
        panel.repaint();
    }
}

public class Main {
    public static void main(String[] args) {
        MovingAnimalFrame frame = new MovingAnimalFrame();
        Timer timer = new Timer(16, (x) -> frame.repaintPanel());
        timer.start();
    }
}

class Generator {
    static final float SCALE = 0.001F;
    static final Random RANDOM = new Random();

    static Frog generateFrog() {
        return new Frog(
                new Point2(0.5, 0),
                (1.5F * RANDOM.nextFloat() + 0.5F) * SCALE,
                (RANDOM.nextFloat() + 1F) * SCALE * 100
        );
    }

    static Gull generateGull() {
        return new Gull(
                new Point2(0.5, 0.8 * RANDOM.nextFloat() + 0.1),
                (4F * RANDOM.nextFloat() + 10F) * SCALE
        );
    }

    static Rat generateRat() {
        return new Rat(
                new Point2(0.5, -0.8 * RANDOM.nextFloat() - 0.1),
                (1.5F * RANDOM.nextFloat() + .5F) * SCALE
        );
    }
}