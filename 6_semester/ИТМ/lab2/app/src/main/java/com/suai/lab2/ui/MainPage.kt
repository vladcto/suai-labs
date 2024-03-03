package com.suai.lab2.ui

import android.content.Intent
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import com.suai.lab2.ui.widgets.images.ImagePickerBottomSheet
import com.suai.lab2.ui.widgets.todo.TodoList

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MainPage(modifier: Modifier = Modifier) {
    val ctx = LocalContext.current
    val sheetState = rememberModalBottomSheetState()
    var showBottomSheet by remember { mutableStateOf(false) }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = modifier.fillMaxWidth()
    ) {
        if (showBottomSheet) {
            ImagePickerBottomSheet(
                onDismiss = { showBottomSheet = false },
                sheetState = sheetState
            )
        }
        // Just mock :3
        Row {
            Button(onClick = { showBottomSheet = !showBottomSheet }) {
                Text(text = "Cоздать карточку")
            }
            Box(
                modifier = Modifier.width(8.dp)
            )
            Button(onClick = {
                val intent = Intent(Intent.ACTION_VIEW)
                intent.type = "image/*"
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                ctx.startActivity(intent)
            }) {
                Text(text = "Добавить из галереи")
            }
        }
        TodoList()
    }
}