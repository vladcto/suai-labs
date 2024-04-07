package com.suai.lab3.presentation.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.suai.lab3.data.Activity
import com.suai.lab3.data.BoredApi
import kotlinx.coroutines.CoroutineExceptionHandler
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import retrofit2.Retrofit
import retrofit2.await
import retrofit2.converter.gson.GsonConverterFactory

val coroutineExceptionHandler = CoroutineExceptionHandler { _, throwable ->
    throwable.printStackTrace()
}

class ActivityViewModel(private val api: BoredApi) : ViewModel() {
    private val _activities = MutableLiveData<List<Activity>>()
    val activities: LiveData<List<Activity>> = _activities

    fun getActivity() {
        viewModelScope.launch(Dispatchers.IO + coroutineExceptionHandler) {
            val result = mutableListOf<Activity>()
            (0..20).forEach { _ ->
                val activity = api.getActivity("busywork").await()
                result.add(activity)
            }
            withContext(Dispatchers.Main + coroutineExceptionHandler) {
                _activities.postValue(result)
            }
        }
    }

    companion object {
        val Factory: ViewModelProvider.Factory = object : ViewModelProvider.Factory {
            @Suppress("UNCHECKED_CAST")
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                // Ну и ладно, что не Dagger
                val retrofit = Retrofit.Builder()
                    .baseUrl("https://boredapi.com/api/")
                    .addConverterFactory(GsonConverterFactory.create())
                    .build()

                return ActivityViewModel(
                    retrofit.create(BoredApi::class.java)
                ) as T
            }
        }
    }
}
