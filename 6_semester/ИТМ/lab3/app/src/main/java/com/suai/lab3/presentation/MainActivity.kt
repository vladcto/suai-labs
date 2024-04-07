package com.suai.lab3.presentation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.IconButton
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.BottomAppBar
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import com.suai.lab3.presentation.theme.Lab3Theme
import com.suai.lab3.presentation.viewmodel.ActivityViewModel
import com.suai.lab3.presentation.widgets.ActivityPage

class MainActivity : ComponentActivity() {
    private val viewModel: ActivityViewModel by viewModels {
        ActivityViewModel.Factory
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Lab3Theme {
                Scaffold(modifier = Modifier.fillMaxSize(),
                    bottomBar = {
                        // Я забыл что нужно делать фрагменты, а офис закрывался в 22
                        // Поэтому сегодня без фрагментов
                        // Там еще этот навхост писать или стейт держать
                        // Я не успею, хоть это и делается минуты 3.
                        BottomAppBar {
                            Spacer(modifier = Modifier.weight(1f))
                            IconButton(onClick = { }) {
                                Icon(Icons.Filled.Menu, contentDescription = "Главная")
                            }
                            Spacer(modifier = Modifier.weight(1f))
                            IconButton(onClick = { }) {
                                Icon(Icons.Filled.Info, contentDescription = "")
                            }
                            Spacer(modifier = Modifier.weight(1f))
                        }
                    },
                    floatingActionButton = {
                        FloatingActionButton(onClick = viewModel::getActivity) {
                            Icon(
                                imageVector = Icons.Default.Refresh,
                                contentDescription = "",
                            )
                        }
                    }) { innerPadding ->
                    ActivityPage(
                        viewModel = viewModel,
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}
