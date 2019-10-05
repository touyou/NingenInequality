package com.inequality.saketify.data

import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory

/**
 * @author nakker
 */
class ApiClient<out T> private constructor(private val builder: Builder<T>) {
    companion object {
        private const val API_BASE_URL = "https://62gxvsjd23.execute-api.ap-northeast-1.amazonaws.com/default/"
    }

    fun create(): T {
        val okHttpClientBulder = OkHttpClient.Builder()
        okHttpClientBulder.addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        })

        val retrofitBuilder = Retrofit.Builder()
        retrofitBuilder.baseUrl(API_BASE_URL)
            .client(okHttpClientBulder.build())
            .addConverterFactory(MoshiConverterFactory.create())
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())

        return retrofitBuilder.build().create(builder.klass)
    }

    class Builder<T>(val klass: Class<T>) {
        fun build(): ApiClient<T> = ApiClient(this)
    }
}
