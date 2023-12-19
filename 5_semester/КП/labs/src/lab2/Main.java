package lab2;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.*;

public class Main {
    static final double SELECTED_VALUE = 1;
    static final double SELECTED_EPSILON = 1;
    static final int LABEL_HEIGHT = 32;
    static final int CONTAINER_HEIGHT = 170 - LABEL_HEIGHT;
    static final int CONTAINER_OFFSET = 216;

    static final String imagePath = "/Users/razrab-ytka/Documents/Projects/SUAI_homework/5_semester/КП/assets/formula_1.jpg";
    static final JFrame frame = new JFrame("Лабораторная работа 2");
    static final JPanel panel = new JPanel(null);
    static final JLabel resLabel = new JLabel();
    static final JSpinner valueSpinner = new JSpinner();
    static final Double[] epsilonListValues = {1.0, 0.1, 0.01, 1e-3, 1e-4, 1e-5};
    static final JList<Double> epsilonList = new JList<>();
    static final String resText = "Reuslt: %.10f";
    static final JButton openTable = new JButton("Открыть");
    static final JButton close = new JButton("Закрыть");
    static final JButton reset = new JButton("Cбросить");

    static double selectedValue = SELECTED_VALUE;
    static double selectedEpsilon = SELECTED_EPSILON;

    public static void main(String[] args) throws IOException {
        setupFrame();
        setupImage();
        setupResLabel();
        setupSpinner();
        setupEpsilonList();
        setupButtons();
        frame.setVisible(true);
        frame.add(panel);
    }

    static void setupFrame() {
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 500);
    }

    static void setupImage() throws IOException {
        final var width = 522;
        final var height = 170;
        BufferedImage myPicture = ImageIO.read(new File(imagePath));
        Image dimg = myPicture.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        final var imageLabel = new JLabel(new ImageIcon(dimg));
        imageLabel.setBounds(35, 30, width, height);
        panel.add(imageLabel);
    }

    static void setupEpsilonList() {
        final var label = new JLabel("Choose epsilon:");
        label.setBounds(220, CONTAINER_OFFSET, 160, LABEL_HEIGHT);
        panel.add(label);

        epsilonList.setListData(epsilonListValues);
        epsilonList.setSelectedIndex(0);
        selectedValue = epsilonListValues[0];
        epsilonList.addListSelectionListener((x) -> {
            selectedEpsilon = epsilonList.getSelectedValue();
            updateResult();
        });
        epsilonList.setBounds(220, CONTAINER_OFFSET + LABEL_HEIGHT, 160, CONTAINER_HEIGHT);
        panel.add(epsilonList);
    }

    static void setupResLabel() {
        resLabel.setBounds(397, CONTAINER_OFFSET, 160, 170);
        panel.add(resLabel);
        updateResult();
    }

    static void setupSpinner() {
        final var label = new JLabel("Choose x:");
        label.setBounds(35, CONTAINER_OFFSET, 160, LABEL_HEIGHT);
        panel.add(label);

        valueSpinner.setModel(new SpinnerNumberModel(selectedValue, -1, 1, 0.1));
        valueSpinner.addChangeListener((x) -> {
            selectedValue = (double) valueSpinner.getValue();
            updateResult();
        });
        valueSpinner.setBounds(35, CONTAINER_OFFSET + LABEL_HEIGHT, 160, CONTAINER_HEIGHT);
        panel.add(valueSpinner);
    }

    static void setupButtons() {
        final var y = CONTAINER_OFFSET + LABEL_HEIGHT + CONTAINER_HEIGHT + 16;

        openTable.addActionListener((x) -> (new TableMath()).setVisible(true));
        openTable.setBounds(0, y, 600 / 3, 40);
        panel.add(openTable);

        close.addActionListener((x) -> System.exit(0));
        close.setBounds(600 / 3, y, 600 / 3, 40);
        panel.add(close);

        reset.addActionListener((x) -> {
            selectedValue = SELECTED_VALUE;
            valueSpinner.setValue(selectedValue);
            epsilonList.setSelectedIndex(0);
            selectedEpsilon = epsilonList.getSelectedValue();
        });
        reset.setBounds(600 / 3 * 2, y, 600 / 3, 40);
        panel.add(reset);
    }

    static void updateResult() {
        final var newValue = MyMath.calculateFunctionValue(selectedValue, selectedEpsilon);
        resLabel.setText(String.format(resText, newValue));
    }
}