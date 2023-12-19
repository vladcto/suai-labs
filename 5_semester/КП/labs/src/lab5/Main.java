package lab5;

import java.util.Scanner;

interface State {
    void askState();

    void nextState(Student student);
}

class StudyingState implements State {
    @Override
    public void askState() {
        System.out.println("Студент в процессе обучения.");
    }

    @Override
    public void nextState(Student student) {
        student.setState(new TakingExamState());
    }
}

class TakingExamState implements State {
    @Override
    public void askState() {
        System.out.println("Студент сдает экзамены.");
    }

    @Override
    public void nextState(Student student) {
        student.setState(new CommissionState());
    }
}

class CommissionState implements State {
    @Override
    public void askState() {
        System.out.println("Студент в комиссии.");
    }

    @Override
    public void nextState(Student student) {
        student.setState(new StudyingState());
    }
}

class Student {
    private State currentState;

    public Student(State initialState) {
        this.currentState = initialState;
    }

    public void setState(State state) {
        this.currentState = state;
    }

    public void askState() {
        currentState.askState();
    }

    public void study() {
        currentState.nextState(this);
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Student student = new Student(new StudyingState());

        while (true) {
            System.out.println("Выберите действие:");
            System.out.println("1. Перейти в следующее состояние");
            System.out.println("0. Выйти");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1 -> student.study();
                case 0 -> {
                    System.out.println("Программа завершена.");
                    scanner.close();
                    System.exit(0);
                }
                default -> System.out.println("Неверный ввод. Попробуйте снова.");
            }

            student.askState();
        }
    }
}
