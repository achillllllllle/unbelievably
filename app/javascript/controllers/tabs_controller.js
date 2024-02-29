import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabContent", "tabLink"];

  connect() {
    console.log("Helloooooooooo")
    this.showTab("wonders");
  }

  toggle(event) {
    event.preventDefault();

    const targetTabId = event.target.hash.substring(1);

    this.tabContentTargets.forEach((tabContent) => {
      tabContent.style.display = "none";
    });
    this.showTab(targetTabId);

    const previousActiveTab = this.element.querySelector(".tab-underlined.active");
      if (previousActiveTab) {
        previousActiveTab.classList.remove("active");
      }
      event.target.classList.add("active");

    if (targetTabId === "wonders") {
      document.getElementById("reservations").classList.add("d-none")
      document.getElementById("saved").classList.add("d-none")
      document.getElementById("wonders").classList.remove("d-none")

    } else if (targetTabId === "reservations") {
      document.getElementById("reservations").classList.remove("d-none")
      document.getElementById("saved").classList.add("d-none")
      document.getElementById("wonders").classList.add("d-none")

    } else if (targetTabId === "saved") {
      document.getElementById("reservations").classList.add("d-none")
      document.getElementById("saved").classList.remove("d-none")
      document.getElementById("wonders").classList.add("d-none")
    }
  }

  showTab(tabId) {
    document.getElementById(tabId).style.display = "block";
  }
}
