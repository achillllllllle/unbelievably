import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "icon", "button"];

  saveWonder(event) {
    console.log(event);

    const textTarget = this.textTarget;
    const iconTarget = this.iconTarget;

    if (textTarget.innerText === textTarget.dataset.textOriginal) {
      textTarget.innerText = textTarget.dataset.textToggled;
      iconTarget.classList.remove("d-none");
    } else {
      textTarget.innerText = textTarget.dataset.textOriginal;
      iconTarget.classList.add("d-none");
    }
  }
}
