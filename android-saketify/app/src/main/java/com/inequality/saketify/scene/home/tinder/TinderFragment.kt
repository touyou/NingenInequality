package com.inequality.saketify.scene.home.tinder

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.NavHostFragment
import com.inequality.saketify.R

/**
 * @author nakker
 */
class TinderFragment : NavHostFragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.fragment_tinder, container, false)
        return view
    }
}
