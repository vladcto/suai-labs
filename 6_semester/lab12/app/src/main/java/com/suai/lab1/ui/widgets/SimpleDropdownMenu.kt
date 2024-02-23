@file:OptIn(ExperimentalMaterial3Api::class)

package com.suai.lab1.ui.widgets

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuBox
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview

@Composable
fun <T> SimpleDropdownMenu(
    item: T,
    options: List<T>,
    onOptionSelected: (T) -> Unit,
    modifier: Modifier = Modifier
) {
    var expanded by remember { mutableStateOf(false) }

    ExposedDropdownMenuBox(
        expanded = expanded,
        onExpandedChange = {
            expanded = !expanded
        },
        modifier = modifier.fillMaxWidth(),
    ) {
        OutlinedButton(
            onClick = {},
            modifier = Modifier
                .menuAnchor()
                .fillMaxWidth(),
        ) {
            Text(text = item.toString())
        }
        ExposedDropdownMenu(expanded = expanded, onDismissRequest = {
            expanded = false
        }) {
            options.forEach { selectionOption ->
                DropdownMenuItem(
                    text = { Text(text = selectionOption.toString()) },
                    onClick = {
                        onOptionSelected(selectionOption)
                        expanded = false
                    },
                )
            }
        }
    }
}

@Preview(widthDp = 200, heightDp = 400)
@Composable
fun SimplePreview() {
    val options = listOf("Option 1", "Option 2", "Option 3", "Option 4")
    var selected by remember {
        mutableStateOf(options[0])
    }
    SimpleDropdownMenu(item = selected, options = options, onOptionSelected = { selected = it })
}
