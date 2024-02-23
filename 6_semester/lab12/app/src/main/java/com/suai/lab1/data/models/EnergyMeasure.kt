package com.suai.lab1.data.models

val energyMeasurementRepository: List<EnergyMeasure> = listOf(
    EnergyMeasure("Joule", 1.0),
    EnergyMeasure("KiloJoule", 1000.0),
    EnergyMeasure("cal", 4.1868),
    EnergyMeasure("kcal", 4186.8),
    EnergyMeasure("Wh", 3600.0),
    EnergyMeasure("Ws", 1.0),
    EnergyMeasure("kWh", 3600000.0),
    EnergyMeasure("erg", .0000001),
    EnergyMeasure("kgf-m", 9.80665),
    EnergyMeasure("tm", 105506000.0),
)

data class EnergyMeasure(val name: String, val joule: Double) {
    fun convertTo(count: Double, output: EnergyMeasure): Double {
        return count * this.joule / output.joule
    }

    override fun toString() = name
}