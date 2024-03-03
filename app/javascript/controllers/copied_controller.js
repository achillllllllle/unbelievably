import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="copied"
export default class extends Controller {
  static targets = ["changeToCopied"];

  clipboard(e) {
    e.preventDefault();

    this.changeToCopiedTarget.textContent = "Copied!";
    let obtainUrl = window.location.href;
    navigator.clipboard.writeText(obtainUrl);
    this.changeToCopiedTarget.style.color = "#808080";

    window.setTimeout(() => {
      this.changeToCopiedTarget.textContent = "Copy Link";
      this.changeToCopiedTarget.style.color = "#000000";
    }, 2000);

 }
}
