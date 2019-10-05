package com.inequality.saketify.scene.home

import android.content.Context
import android.location.Criteria
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.inequality.saketify.R
import kotlinx.android.synthetic.main.activity_main.*

class HomeActivity : AppCompatActivity(), OnMapReadyCallback, LocationListener {

    private lateinit var googleMap: GoogleMap
    private lateinit var sakeAdapter: SakeAdapter
    private lateinit var locationManager: LocationManager
    private lateinit var bestProvider: String

    private val viewModel: HomeViewModel by viewModels {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel?> create(modelClass: Class<T>): T {
                return HomeViewModel() as T
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val mapFragment = supportFragmentManager
                .findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)

        initAdapter()
        viewModel.fetchSakeList()
    }

    override fun onMapReady(googleMap: GoogleMap) {
        this.googleMap = googleMap

        val tokyo = LatLng(35.6551564, 139.6936439)
        googleMap.addMarker(MarkerOptions().position(tokyo))
        googleMap.moveCamera(CameraUpdateFactory.newLatLngZoom(tokyo, 14F))
        initLocationManager()
    }

    override fun onLocationChanged(location: Location?) {
        location?.let {
            val myLocation = LatLng(it.latitude, it.latitude)
            googleMap.addMarker(MarkerOptions().position(myLocation))
            googleMap.moveCamera(CameraUpdateFactory.newLatLngZoom(myLocation, 18F))
            runCatching { locationManager.removeUpdates(this) }
        }
    }

    override fun onStatusChanged(p0: String?, p1: Int, p2: Bundle?) {
    }

    override fun onProviderEnabled(p0: String?) {
    }

    override fun onProviderDisabled(p0: String?) {
    }

    private fun initAdapter() {
        sakeAdapter = SakeAdapter(this)
        recycler_view.apply {
            this.layoutManager = LinearLayoutManager(this@HomeActivity)
            adapter = sakeAdapter
        }

        viewModel.sakeListData.observe(this, androidx.lifecycle.Observer {
            sakeAdapter.submitList(it)
            it.forEach {
                googleMap.addMarker(MarkerOptions().position(LatLng(it.latitude.toDouble(), it.longitude.toDouble())))
            }
        })
    }

    private fun initLocationManager() {
        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager

        val criteria = Criteria()
        criteria.accuracy = Criteria.ACCURACY_FINE
        criteria.powerRequirement = Criteria.POWER_HIGH
        criteria.isSpeedRequired = false
        criteria.isAltitudeRequired = false
        criteria.isBearingRequired = false
        criteria.isCostAllowed = true
        criteria.horizontalAccuracy = Criteria.ACCURACY_HIGH
        criteria.verticalAccuracy = Criteria.ACCURACY_HIGH
        bestProvider = locationManager.getBestProvider(criteria, true)
    }
}
