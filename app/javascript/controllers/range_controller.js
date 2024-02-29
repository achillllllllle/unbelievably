import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="range"
export default class extends Controller {
  static targets = [
    "valueDisplayFromShow",
    "valueDisplayFromNew",
    "priceDisplayFromShow",
  ];



  performValueFromShow(e) {

    this.priceDisplayFromShowTarget.textContent =
    e.currentTarget.value *
    parseInt(this.priceDisplayFromShowTarget.dataset.price, 10) + "€";
    this.valueDisplayFromShowTarget.textContent =
    e.currentTarget.value + " people";

  }
  performValueFromNew(e) {

    this.valueDisplayFromNewTarget.textContent = e.currentTarget.value + " €";
  }
}
