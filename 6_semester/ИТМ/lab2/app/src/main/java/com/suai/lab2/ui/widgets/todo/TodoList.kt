package com.suai.lab2.ui.widgets.todo

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.suai.lab2.data.todo.TodoItem
import com.suai.lab2.data.todo.TodoItemRepository


@Composable
fun TodoList(modifier: Modifier = Modifier) {
    val items = remember {
        mutableStateListOf<TodoItem>().apply {
            addAll(TodoItemRepository.items)
        }
    }

    val verticalScroll = rememberScrollState()

    Column(
        modifier = modifier
            .verticalScroll(verticalScroll)
            .padding(horizontal = 8.dp)
    ) {
        items.onEachIndexed { i, item ->
            TodoItemView(
                item = item,
                onCheckChange = {
                    items[i] = items[i].copy(closed = !items[i].closed)
                },
            )
        }
    }
}