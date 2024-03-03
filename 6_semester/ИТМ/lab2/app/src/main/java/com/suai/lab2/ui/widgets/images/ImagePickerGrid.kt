package com.suai.lab2.ui.widgets.images

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.suai.lab2.data.images.InfoImage
import com.suai.lab2.data.images.InfoImageRepository

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun ImagePickerList(onChoose: (InfoImage) -> Unit, modifier: Modifier = Modifier) {
    val pagerState = rememberPagerState(pageCount = {
        InfoImageRepository.images.count()
    })

    HorizontalPager(state = pagerState) {
        Text(
            text = "Page $it",
            modifier = Modifier.fillMaxWidth()
        )
    }
}
