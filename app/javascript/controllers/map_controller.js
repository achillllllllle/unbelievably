import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/achillle/clt7gepd9009d01qphtz20br7"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    new mapboxgl.Marker()
      .setLngLat([this.markerValue.lng, this.markerValue.lat])
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.markerValue.lng, this.markerValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 4, duration: 0 })
  }
}
