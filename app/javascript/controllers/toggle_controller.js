import { Controller } from "@hotwired/stimulus"

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
  }
}
