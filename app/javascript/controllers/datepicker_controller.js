import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["book_date"];

  connect() {
    flatpickr(this.book_dateTarget, { dateFormat: "d-m-Y", minDate: "today", disable: ["today"], inline: true });
  }
}
