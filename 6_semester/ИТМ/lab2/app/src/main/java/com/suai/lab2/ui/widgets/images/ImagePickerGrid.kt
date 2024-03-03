package com.suai.lab2.ui.widgets.images

import android.icu.text.IDNA.Info
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.suai.lab2.data.images.InfoImage
import com.suai.lab2.data.images.InfoImageRepository

@Composable
fun ImagePickerGrid(onChoose: (InfoImage) -> Unit, modifier: Modifier = Modifier) {
    LazyVerticalGrid(
        columns = GridCells.Fixed(4),
        modifier = modifier,
    ) {
        items(InfoImageRepository.images) { infoImage ->
            ImageCard(infoImage = infoImage, onChoose = onChoose)
        }
    }
}

@Composable
fun ImageCard(infoImage: InfoImage, onChoose: (InfoImage) -> Unit, modifier: Modifier = Modifier) {
    Box(
        contentAlignment = Alignment.Center,
        modifier = modifier
            .padding(4.dp)
            .fillMaxSize()
            .clickable { onChoose(infoImage) }
    ) {
        AsyncImage(
            model = infoImage.src,
            contentDescription = "Image from network",
            contentScale = ContentScale.Crop,
            modifier = Modifier.fillMaxSize()
        )
    }
}

@Preview
@Composable
fun PreviewImagePickerGrid() {
    ImagePickerGrid({
    })
}