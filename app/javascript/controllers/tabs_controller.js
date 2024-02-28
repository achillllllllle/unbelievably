import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabContent"];

  connect() {
    console.log("Helloooooooooo")
  }

  toggle(event) {
    event.preventDefault();

    const targetTabId = event.target.hash.substring(1);

    this.tabContentTargets.forEach((tabContent) => {
      tabContent.style.display = "none";
    });

    if (targetTabId === "wonders") {
      document.getElementById("reservations").classList.add("d-none")
      document.getElementById("wonders").classList.remove("d-none")

    } else {
      document.getElementById("reservations").classList.remove("d-none")
      document.getElementById("wonders").classList.add("d-none")
    }

    document.getElementById(targetTabId).style.display = "block";
  }
}
