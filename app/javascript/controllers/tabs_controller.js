import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabContent", "tabLink", "reservationsButton", "reservation"];
  static values = {
    tab: String,
    reservationId: Number
  };

  connect() {
    addEventListener("turbo:load", this.openReservationsAndScrollToReservation.bind(this))
  }

  disconnect() {
    removeEventListener("turbo:load", this.openReservationsAndScrollToReservation.bind(this));
  }

  openReservationsAndScrollToReservation() {
    if (this.hasReservationIdValue && this.reservationIdValue > 0) {
      this.openReservations();
      const targetReservation = this.reservationTargets.find(reservation => parseInt(reservation.dataset.reservationId, 10) === this.reservationIdValue);

      const yOffset = -500;
      const y = targetReservation.getBoundingClientRect().top + window.scrollY + yOffset;

      // console.log('scrolling to', y, targetReservation.getBoundingClientRect().top, window.scrollY, yOffset, targetReservation);
      window.scrollTo({top: y, behavior: 'smooth'});
      targetReservation.classList.add('reservation-highlight');
      this.reservationIdValue = null; // WTFFFFFFFFFFF
    }
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
      this.openWonders();
    } else if (targetTabId === "reservations") {
      this.openReservations();
    } else if (targetTabId === "saved") {
      this.openSaved();
    }
  }

  openWonders() {
    document.getElementById("reservations").classList.add("d-none")
    document.getElementById("saved").classList.add("d-none")
    document.getElementById("wonders").classList.remove("d-none")
  }

  openReservations() {
    document.getElementById("reservations").classList.remove("d-none")
    document.getElementById("saved").classList.add("d-none")
    document.getElementById("wonders").classList.add("d-none")
  }

  openSaved() {
    document.getElementById("reservations").classList.add("d-none")
    document.getElementById("saved").classList.remove("d-none")
    document.getElementById("wonders").classList.add("d-none")
  }

  showTab(tabId) {
    document.getElementById(tabId).style.display = "block";
  }
}
