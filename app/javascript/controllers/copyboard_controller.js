import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="copyboard"
export default class extends Controller {
  clipboard(e) {
    e.preventDefault();
    const button = e.currentTarget;
    const oldText = button.innerHTML;
    const currentUrl = `https://airbnb-achillllllllle-f17ce457e3ce.herokuapp.com${window.location.pathname}`;
    navigator.clipboard.writeText(currentUrl);
    button.innerHTML = "Copied !";
    setTimeout(() => {
      button.innerHTML = oldText;
    }, 3000);
  }
}
