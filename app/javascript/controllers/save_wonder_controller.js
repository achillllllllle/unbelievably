import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["createBtn", "destroyBtn"];

  create(event) {
    event.preventDefault()

    const url = event.currentTarget.href
    const options = {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csrfToken()
      }
    }

    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        this.createBtnTarget.classList.toggle('d-none', data.success)
        this.destroyBtnTarget.classList.toggle('d-none', !data.success)
      })
  }

  destroy(event) {
    event.preventDefault()

    const url = event.currentTarget.href
    const options = {
      method: "DELETE",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csrfToken()
      }
    }

    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        this.createBtnTarget.classList.toggle('d-none', !data.success)
        this.destroyBtnTarget.classList.toggle('d-none', data.success)
      })
  }

  csrfToken() {
    return document.querySelector('[name="csrf-token"]').content
  }
}
