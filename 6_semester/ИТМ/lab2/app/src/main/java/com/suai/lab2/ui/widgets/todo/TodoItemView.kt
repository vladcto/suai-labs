package com.suai.lab2.ui.widgets.todo

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.ShoppingCart
import androidx.compose.material3.Checkbox
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.suai.lab2.data.images.InfoImage
import com.suai.lab2.data.todo.TodoItem

@Composable
fun TodoItemView(
    onCheckChange: () -> Unit, item: TodoItem, modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .clickable(
                onClick = onCheckChange,
            ),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Checkbox(
            checked = item.closed,
            onCheckedChange = {},
            modifier = Modifier.pointerInput(Unit) {})
        Text(
            text = item.title,
            textDecoration = if (item.closed) TextDecoration.LineThrough else null
        )
        Box(modifier = Modifier.width(4.dp))
        AsyncImage(
            model = item.image.src,
            contentDescription = "Item image",
            modifier = Modifier
                .height(32.dp)
                .width(32.dp)
        )
    }
}

@Preview
@Composable
private fun TodoItemPreviewOpened() {
    TodoItemView(
        item = TodoItem(title = "Длинный title", closed = false, image = InfoImage("")),
        onCheckChange = {},
    )
}

@Preview
@Composable
private fun TodoItemPreviewClosed() {
    TodoItemView(
        item = TodoItem(title = "Длинный title", closed = true, image = InfoImage("")),
        onCheckChange = {},
    )
}