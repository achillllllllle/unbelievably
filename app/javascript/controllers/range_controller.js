import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="range"
export default class extends Controller {
  static targets = ["valueDisplay"];

  performValue(e) {
   this.valueDisplayTarget.textContent = e.currentTarget.value + " people";
  }
}
