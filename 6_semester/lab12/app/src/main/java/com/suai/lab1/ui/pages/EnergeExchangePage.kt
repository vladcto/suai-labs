package com.suai.lab1.ui.pages

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.ArrowForward
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.suai.lab1.data.models.energyMeasurementRepository
import com.suai.lab1.ui.viewmodel.ExchangeViewModel
import com.suai.lab1.ui.theme.AppTheme
import com.suai.lab1.ui.widgets.SimpleDropdownMenu

@OptIn(ExperimentalLayoutApi::class, ExperimentalMaterial3Api::class)
@Composable
fun EnergyExchangePage(
    exchangeViewModel: ExchangeViewModel = ExchangeViewModel()
) {
    val space = @Composable {
        Spacer(
            modifier = Modifier.height(32.dp)
        )
    }
    val measurements = energyMeasurementRepository
    val exchangeState by exchangeViewModel.state.collectAsState()
    val focusManager = LocalFocusManager.current

    Scaffold(
        topBar = {
            CenterAlignedTopAppBar(
                title = { Text("Energy Converter") },
                colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.primary,
                ),
            )
        }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .padding(innerPadding)
                .padding(32.dp)
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
        ) {
            space()
            OutlinedTextField(
                value = exchangeState.inputCount.toBigDecimal().toPlainString(),
                onValueChange = {
                    if (it.replace("\n", "q").toDoubleOrNull() == null) {
                        focusManager.clearFocus()
                        return@OutlinedTextField
                    }
                    exchangeViewModel.setInputCount(it.toDouble())
                    println(exchangeState.outputCount)
                },
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Number,
                ),
                modifier = Modifier.fillMaxWidth()
            )
            FlowRow(
                modifier = Modifier.padding(horizontal = 16.dp),
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                SimpleDropdownMenu(
                    item = exchangeState.inputMeasure,
                    options = measurements,
                    onOptionSelected = exchangeViewModel::setInputMeasure,
                    modifier = Modifier.weight(1f)
                )
                Icon(
                    Icons.Rounded.ArrowForward,
                    contentDescription = "",
                    modifier = Modifier.align(Alignment.CenterVertically)
                )
                SimpleDropdownMenu(
                    item = exchangeState.outputMeasure,
                    options = measurements,
                    onOptionSelected = exchangeViewModel::setOutputMeasure,
                    modifier = Modifier.weight(1f)
                )

            }
            space()
            Text(text = "YOUR EEEENERGYYY")
            Text(exchangeState.outputCount.toString())
        }
    }
}

@Preview(showBackground = true, device = Devices.PIXEL_4)
@Composable
fun EnergyExchangePagePreview() {
    AppTheme {
        EnergyExchangePage()
    }
}