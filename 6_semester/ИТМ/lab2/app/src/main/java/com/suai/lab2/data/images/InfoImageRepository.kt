package com.suai.lab2.data.repository

import com.suai.lab2.data.models.InfoImage

abstract class InfoImageRepository {
    fun fetch(): List<InfoImage> = images

    companion object {
        val images: List<InfoImage> = listOf(
            InfoImage(""),
        )
    }
}