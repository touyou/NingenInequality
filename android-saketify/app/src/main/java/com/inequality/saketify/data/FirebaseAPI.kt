package com.inequality.saketify.data

import com.google.firebase.firestore.FirebaseFirestore

object FirebaseAPI {
    private val rootSnapshot: FirebaseFirestore

    init {
        rootSnapshot =  FirebaseFirestore.getInstance()
    }

    fun getData(callback: (List<BeerItem>)->Void) {
        rootSnapshot.collection("items")
            .get()
            .addOnCompleteListener {
                if (it.isSuccessful) {
                    val items = it.result?.toObjects(BeerItem::class.java)
                    if (items != null) {
                        callback(items)
                    }
                } else {
                    print("error")
                }
            }
    }

    fun add(item: BeerItem) {
        rootSnapshot.collection("items")
            .document().set(item)
    }
}