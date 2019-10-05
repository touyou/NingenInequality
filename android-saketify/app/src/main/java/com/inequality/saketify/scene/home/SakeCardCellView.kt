package com.inequality.saketify.scene.home

import android.content.Context
import android.util.AttributeSet
import androidx.constraintlayout.widget.ConstraintLayout
import com.inequality.saketify.model.Sake
import kotlinx.android.synthetic.main.item_sake_card_cell.view.*

/**
 * @author nakker
 */
class SakeCardCellView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null, defStyleAttr: Int = 0)
    : ConstraintLayout(context, attrs, defStyleAttr) {

    fun build(sake: Sake) {
        name.text = sake.name
        genre.text = sake.category
    }

}
