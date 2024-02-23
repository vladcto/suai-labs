package com.suai.lab1.ui.viewmodel

import androidx.lifecycle.ViewModel
import com.suai.lab1.data.models.EnergyMeasure
import com.suai.lab1.data.models.energyMeasurementRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update

data class ExchangeState(
    val inputMeasure: EnergyMeasure,
    val inputCount: Double,
    val outputMeasure: EnergyMeasure,
) {
    val outputCount: Double = inputMeasure.convertTo(inputCount, outputMeasure)
}

class ExchangeViewModel : ViewModel() {
    private val _state = MutableStateFlow(
        ExchangeState(
            inputMeasure = energyMeasurementRepository[0],
            inputCount = 0.0,
            outputMeasure = energyMeasurementRepository[1],
        )
    )
    val state = _state.asStateFlow()

    fun setInputMeasure(measure: EnergyMeasure) {
        _state.update { state ->
            state.copy(inputMeasure = measure)
        }
    }

    fun setOutputMeasure(measure: EnergyMeasure) {
        _state.update { state ->
            state.copy(outputMeasure = measure)
        }
    }

    fun setInputCount(count: Double) {
        _state.update { state ->
            state.copy(inputCount = count)
        }
    }
}