---
department: 42
teacher: Суетина Т. А.
teacher_title: Доцент
theme: Энтропийные алгоритмы сжатия информации
variant: 5
number: 1
discipline: Техника аудиовизуальных средств информации
group: 4128
student: Воробьев В. А.
---

# Введение

## Цель лабораторной работы

Освоить алгоритмы для сжатия информации.

## Задание

Выполнить сжатие текста 4 способами:

- Метод Хаффмана;
- Метод Шенона-Фано;
- Арифметическим кодированием;
- Алгоритмом LZW.

Для каждого метода рассчитать коэффициент сжатия текста.

**Вариант 5:** ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ

# Выполнение работы

## Теоретические сведения

$$
K = \frac{V_{вх}}{V_{вых}},
$$

где K - степень сжатия.

## Анализ исходного текста

Для начала проанализируем текст.

Table: Количество вхождений символов.

| Буква  |  Ш  |  О  |  Р  |  Х  | space |  Д  |  У  |  Б  |  К  |  А  |  Т  |
| ------ | :-: | :-: | :-: | :-: | :---: | :-: | :-: | :-: | :-: | :-: | :-: |
| Кол-во |  2  |  6  |  2  |  2  |   5   |  2  |  2  |  2  |  3  |  2  |  2  |

**Всего букв:** 30

## Метод Шеннона-Фано

\sucsvtable{huffman.csv}{Решение методом Шеннона-Фано}

Итоговый код:

$[\,0111\,\,11\,\,0110\,\,11\,\,0101\,]\allowbreak101\allowbreak[\,11\,\,0000\,]\allowbreak101\allowbreak[\,0100\,\,0011\,\,0010\,\,100\,\,0001\,]\allowbreak101\allowbreak[\,100\,\,0001\,\,100\,]\allowbreak101\allowbreak[\,0010\,\,0011\,\,0100\,\,0000\,\,11\,]\allowbreak101\allowbreak[\,0101\,\,11\,\,0110\,\,11\,\,0111\,]$

Коэффициент сжатия по формуле 2.1: $K=120/100=1.2$

## Метод Хаффмана

![Граф для метода Хаффмана](huffman.png)

Итоговый код:

$[\,1100\,\,10\,\,0111\,\,10\,\,0110\,]\allowbreak000\allowbreak[\,10\,\,1101\,]\allowbreak000\allowbreak[\,0101\,\,0100\,\,0011\,\,111\,\,0010\,]\allowbreak000\allowbreak[\,111\,\,0010\,\,111\,]\allowbreak000\allowbreak[\,0011\,\,0100\,\,0101\,\,1101\,\,10\,]\allowbreak000\allowbreak[\,0110\,\,10\,\,0111\,\,10\,\,1100\,]$

Коэффициент сжатия по формуле 2.1: $K=120/100=1.2$

## Арифметическое кодирование

Скрипт на Python представлен в Приложении, результат его работы изображен на \ref{fig:Результат арифметического кодирования}.

![Результат арифметического кодирования](report_images/image-10.png)

Видно, что сообщение можно закодировать $0.68996327221441838184657504011251160886509553701945$.

Исходя из рисунка \ref{fig:Результат арифметического кодирования}, можно сделать вывод, что сообщение можно закодировать количеством бит равным = $90$.

Коэффициент сжатия по формуле 2.1: $K=124/90=1.34$

## Алгоритм LZW

Скрипт на Python представлен в Приложении, результат его работы изображен на \ref{fig:Результат работы LZW}.

![Результат работы LZW](report_images/image-11.png)<l>

Коэффициент сжатия по формуле 2.1: $K=240/252=0.95$

# Вывод

В ходе выполнения лабораторной мы сжали исходную строку "ШОРОХ ОТ ДУБКА КАК БУДТО ХОРОШ" 4 разными способами. Для каждого способа мы посчитали коэффициент сжатия текста, и получили следующие значения:

1. Арифметическое кодирование = $1.34$
2. Метод Хаффмана = $1.2$
3. Метод Шенона-Фано = $1.2$
4. Алгоритм LZW = $0.95$

Как мы видим, арифмитическое кодирование имеет самую высокую степень сжатия, но тем не требует значительно большую мощность вычислительных ресурсов.

Метод Хаффмана и метод Шенона-Фано имеет одинаковую степень сжатия. Эти алгоритмы являются простыми в реализации, поэтому для некоторых задач могут быть весьма эффективными.

Алгоритм LZW имеет степень сжатия меньше единицы. Тем не менее если подать строку больше длинны, то мы получим более высокие результаты.

# ПРИЛОЖЕНИЕ <suaidoc-center>

**Листинг арифметического кодирования:**

\lstinputlisting{arithmetic_coding.py}

**Листинг LZW кодирования:**

\lstinputlisting{lzw_encode.py}

**Листинг кодирования по словарю:**

\lstinputlisting{fill_word.py}