import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log("Hello from tabs_controller.js");
  }

  toggle(event) {
    event.preventDefault();
    this.contentTargets.forEach(target => target.classList.toggle("d-none"));
  }
}
