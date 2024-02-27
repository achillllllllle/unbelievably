import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDates", "endDates"];

  connect() {
    flatpickr(this.startDatesTarget, { dateFormat: "d-m-Y", minDate: "today" });
    flatpickr(this.endDatesTarget, { dateFormat: "d-m-Y", minDate: "today" });
  }
  
}
