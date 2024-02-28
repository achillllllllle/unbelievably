import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "icon"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  offer() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.toggleIcon();
  }

  toggleIcon(button) {
    const icon = this.iconTarget;
    icon.classList.toggle('active')
    // icon.classList.toggle("fa-chevron-down");
    // icon.classList.toggle("fa-chevron-up");
  }
}
