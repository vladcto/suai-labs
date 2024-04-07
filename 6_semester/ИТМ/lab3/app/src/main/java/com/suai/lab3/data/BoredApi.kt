package com.suai.lab3.data

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface BoredApi {
    @GET("activity")
    fun getActivity(@Query("type") type: String): Call<Activity>
}