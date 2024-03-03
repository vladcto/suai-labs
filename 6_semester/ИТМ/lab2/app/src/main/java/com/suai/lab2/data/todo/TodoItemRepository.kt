package com.suai.lab2.data.todo

import com.suai.lab2.data.images.InfoImageRepository

class TodoItemRepository {
    companion object {
        val items = listOf(
            TodoItem("Заскочить за прямоугольником", InfoImageRepository.images[1], closed = false),
            TodoItem("Закругляемся", InfoImageRepository.images[0], closed = false),
            TodoItem("Поломать ребра треугольнику", InfoImageRepository.images[1], closed = false),
            TodoItem("Сгладить октагон", InfoImageRepository.images[2], closed = true),
            TodoItem("Отполировать ромб", InfoImageRepository.images[0], closed = false),
            TodoItem("Заострить звезду", InfoImageRepository.images[1], closed = false),
            TodoItem("Раскрасить круг", InfoImageRepository.images[0], closed = false),
            TodoItem("Изгибить линию", InfoImageRepository.images[2], closed = true),
            TodoItem("Растянуть эллипс", InfoImageRepository.images[3], closed = false),
            TodoItem("Соединить точки", InfoImageRepository.images[0], closed = false),
            TodoItem("Разбить параллелограмм", InfoImageRepository.images[1], closed = true),
            TodoItem("Закрасить трапецию", InfoImageRepository.images[3], closed = false),
            TodoItem("Создать многоугольник", InfoImageRepository.images[2], closed = false),
            TodoItem("Заскочить за прямоугольником", InfoImageRepository.images[3], closed = false),
            TodoItem("Закругляемся", InfoImageRepository.images[4], closed = false),
            TodoItem("Поломать ребра треугольнику", InfoImageRepository.images[4], closed = false),
            TodoItem("Сгладить октагон", InfoImageRepository.images[0], closed = true),
            TodoItem("Отполировать ромб", InfoImageRepository.images[3], closed = false),
            TodoItem("Заострить звезду", InfoImageRepository.images[0], closed = false),
            TodoItem("Раскрасить круг", InfoImageRepository.images[1], closed = false),
            TodoItem("Изгибить линию", InfoImageRepository.images[0], closed = true),
            TodoItem("Растянуть эллипс", InfoImageRepository.images[2], closed = false),
            TodoItem("Соединить точки", InfoImageRepository.images[0], closed = false),
            TodoItem("Разбить параллелограмм", InfoImageRepository.images[2], closed = true),
            TodoItem("Закрасить трапецию", InfoImageRepository.images[1], closed = false),
            TodoItem("Создать многоугольник", InfoImageRepository.images[0], closed = false),
            TodoItem("Заскочить за прямоугольником", InfoImageRepository.images[0], closed = false),
            TodoItem("Закругляемся", InfoImageRepository.images[0], closed = false),
            TodoItem("Поломать ребра треугольнику", InfoImageRepository.images[0], closed = false),
            TodoItem("Сгладить октагон", InfoImageRepository.images[0], closed = true),
            TodoItem("Отполировать ромб", InfoImageRepository.images[3], closed = false),
            TodoItem("Заострить звезду", InfoImageRepository.images[4], closed = false),
            TodoItem("Раскрасить круг", InfoImageRepository.images[3], closed = false),
            TodoItem("Изгибить линию", InfoImageRepository.images[0], closed = true),
            TodoItem("Растянуть эллипс", InfoImageRepository.images[1], closed = false),
            TodoItem("Соединить точки", InfoImageRepository.images[0], closed = false),
            TodoItem("Разбить параллелограмм", InfoImageRepository.images[0], closed = true),
            TodoItem("Закрасить трапецию", InfoImageRepository.images[4], closed = false),
            TodoItem("Создать многоугольник", InfoImageRepository.images[0], closed = false),
        )
    }
}