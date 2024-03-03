package com.suai.lab2.data.todo

import com.suai.lab2.data.images.InfoImage

data class TodoItem(
    val title: String, val image: InfoImage,
    val closed: Boolean
)