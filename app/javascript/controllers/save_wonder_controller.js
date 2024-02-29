import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-wonder"
export default class extends Controller {
  static targets = ["wonder"];

  save() {
    const wonderId = this.wonderTarget.dataset.wonderId;

    fetch('/save_wonder', {
      method: "POST",
      headers: {},
      body: {}}
    )
  }
}
