import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="range"
export default class extends Controller {
  static targets = ["valueDisplayFromShow", "valueDisplayFromNew"];


  performValueFromShow(e) {
   this.valueDisplayFromShowTarget.textContent = e.currentTarget.value + " people";
  }
  performValueFromNew(e) {
    this.valueDisplayFromNewTarget.textContent = e.currentTarget.value + " €";
   }
}
