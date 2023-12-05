package lab1;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.function.BiFunction;

public class Main {
    static final Set<Character> lowerVowels = new HashSet<>(Arrays.asList('a', 'e', 'i', 'o', 'u'));

    public static void main(String[] args) throws IOException {
        var strings = getStrings();
        mySort(strings);
        updateString(strings);
        printResult(strings);
    }

    static List<String> getStrings() {
        Scanner in = new Scanner(System.in);
        System.out.println("Введите количество строк: ");
        final var lineCount = in.nextInt();
        in.nextLine();

        System.out.println("Введите строки: ");
        final var list = new ArrayList<String>(lineCount);
        for (int i = 0; i < lineCount; i++) {
            list.add(in.nextLine());
        }
        return list;
    }

    static void mySort(List<String> list) {
        final BiFunction<String, String, Boolean> compare =
                (String a, String b) -> a.length() > b.length();

        for (var i = list.size() - 1; i > 0; i--) {
            var max = i;
            for (var j = i - 1; j >= 0; j--) {
                max = compare.apply(list.get(j), list.get(max)) ? j : max;
            }
            swap(list, i, max);
        }
    }

    static <T> void swap(List<T> list, int p1, int p2) {
        var tmp = list.get(p1);
        list.set(p1, list.get(p2));
        list.set(p2, tmp);
    }

    static void updateString(List<String> list) {
        list.replaceAll(s -> s + s.toLowerCase()
                .chars()
                .filter(x -> lowerVowels.contains((char) x))
                .count());
    }

    static void printResult(List<String> result) throws IOException {
        Scanner in = new Scanner(System.in);
        System.out.println("Введите путь выходного файла, например: ");
        System.out.println("/Users/razrab-ytka/Documents/Projects/SUAI_homework/5_semester/КП/src/lab1/res.txt");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(in.nextLine()))) {
            for (var line : result) {
                writer.write(line + "\n");
            }
            writer.write("4128 Воробьев Влад - " + LocalDateTime.now());
        }
    }
}