import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icons"
export default class extends Controller {
  static targets = ["icon"]
  connect() {
    console.log("icons controller active")
  }
  toggleclass() {
    var element = document.getElementById("bookmark");
    // element.style.color = "#ff0000";
    element.classList.toggle("fa-regular");
    element.classList.toggle("fa-solid");
    // element.addEventListener('click', this.toggleclass)
  }
  bookmarkIcon = document.getElementById("bookmark").addEventListener('click', this.toggleclass)
}
