package com.inequality.saketify.model

/**
 * @author nakker
 */
data class Sake(
    val id: String,
    val name: String,
    val longitude: String,
    val latitude: String,
    val category: String,
    val imageUrl: String
) {

    data class ImageUrl(
        val shopImage1: String,
        val shopImage2: String,
        val qrCode: String
    )
}
