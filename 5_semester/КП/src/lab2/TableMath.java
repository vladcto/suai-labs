package lab2;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import java.awt.*;

public class TableMath extends JFrame {

    private JTextField startXField, endXField, stepField, precisionField;
    private JTable resultTable;

    public TableMath() {
        setSize(600, 400);
        initComponents();
    }

    private void initComponents() {
        JPanel inputPanel = new JPanel(new GridLayout(5, 2));

        inputPanel.add(new JLabel("Начало отрезка:"));
        startXField = new JTextField();
        inputPanel.add(startXField);

        inputPanel.add(new JLabel("Конец отрезка:"));
        endXField = new JTextField();
        inputPanel.add(endXField);

        inputPanel.add(new JLabel("Шаг:"));
        stepField = new JTextField();
        inputPanel.add(stepField);

        inputPanel.add(new JLabel("Точность:"));
        precisionField = new JTextField();
        inputPanel.add(precisionField);

        inputPanel.add(new JLabel());
        JButton calculateButton = new JButton("Считаем");
        calculateButton.addActionListener((x) -> calculateAndDisplayResults());
        inputPanel.add(calculateButton);

        resultTable = new JTable(new DefaultTableModel(new Object[]{"X", "Результат", "Эталон"}, 0));
        JScrollPane tableScrollPane = new JScrollPane(resultTable);

        add(inputPanel, BorderLayout.NORTH);
        add(tableScrollPane, BorderLayout.CENTER);
    }

    private void calculateAndDisplayResults() {
        DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
        model.setRowCount(0);

        double startX = Double.parseDouble(startXField.getText());
        double endX = Double.parseDouble(endXField.getText());
        double step = Double.parseDouble(stepField.getText());
        double precision = Double.parseDouble(precisionField.getText());

        for (double x = startX; x <= endX; x += step) {
            double result = MyMath.calculateFunctionValue(x, precision);
            double referenceResult = Math.atan(x);

            model.addRow(new Object[]{x, result, referenceResult});
        }
    }
}
