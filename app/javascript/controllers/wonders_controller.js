import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  newWonder(event) {
    event.preventDefault();

    fetch('/wonders/new', {
      headers: {
        'X-Requested-With': 'XMLHttpRequest', 'Accept': 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript',
      }
    })
      .then(response => response.text())
      .then(html => {
        document.querySelector('#newWonderModal .modal-body').innerHTML = html
        var myModal = new bootstrap.Modal(document.getElementById('newWonderModal'))
        myModal.show()
      })
  }

  toReservations() {
    window.location.href = "/user#reservations";
  }
}
