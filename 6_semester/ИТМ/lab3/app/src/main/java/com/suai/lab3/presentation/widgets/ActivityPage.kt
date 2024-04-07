package com.suai.lab3.presentation.widgets

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import com.suai.lab3.presentation.viewmodel.ActivityViewModel

@Composable
fun ActivityPage(viewModel: ActivityViewModel, modifier: Modifier) {
    val activities by viewModel.activities.observeAsState()
    LazyColumn(modifier = modifier) {
        itemsIndexed(activities ?: listOf()) { _, item ->
            ActivityCard(item)
        }
    }
}