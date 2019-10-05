package com.inequality.saketify.scene.home

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.inequality.saketify.R
import com.inequality.saketify.model.Sake

/**
 * @author nakker
 */
class SakeAdapter(private val context: Context) : ListAdapter<Sake, SakeAdapter.ViewHolder>(diffCallback) {

    companion object {
        private val diffCallback = object : DiffUtil.ItemCallback<Sake>() {
            override fun areItemsTheSame(oldItem: Sake, newItem: Sake): Boolean {
                return oldItem.id == newItem.id
            }

            override fun areContentsTheSame(oldItem: Sake, newItem: Sake): Boolean {
                return oldItem == newItem
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(context).inflate(R.layout.item_sake_card_cell, parent, false) as SakeCardCellView
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.view.build(getItem(position))
    }

    class ViewHolder(val view: SakeCardCellView) : RecyclerView.ViewHolder(view)
}
