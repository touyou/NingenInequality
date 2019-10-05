package com.inequality.saketify.scene.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.inequality.saketify.model.Sake

/**
 * @author nakker
 */
class HomeViewModel : ViewModel() {

    private val _sakeListData: MutableLiveData<List<Sake>> = MutableLiveData()
    val sakeListData: LiveData<List<Sake>> = _sakeListData

    fun fetchSakeList() {
        _sakeListData.postValue(
                listOf(
                        Sake(
                                "7563651",
                                "酒 みさわ そば うどん処",
                                "139.693349",
                                "35.654747",
                                "そば",
                                ""
                        ),
                        Sake(
                                "5429710",
                                "なかあら井",
                                "139.694198",
                                "35.655394",
                                "懐石料理",
                                ""
                        ),
                        Sake(
                                "6939580",
                                "ライスプラス",
                                "139.694198",
                                "35.655394",
                                "カフェ",
                                ""
                        ),
                        Sake("5908754",
                                "EVANS",
                                "139.693520",
                                "35.655703",
                                "立ち呑みBａｒ",
                                ""
                        ),
                        Sake("7669376",
                                "BAR神泉",
                                "139.693354",
                                "35.655669",
                                "バー",
                                ""
                        ),
                        Sake("7657932",
                                "Ninety Plus",
                                "35.655669",
                                "139.693354",
                                "バー",
                                ""
                        )
                )

        )

    }
}
