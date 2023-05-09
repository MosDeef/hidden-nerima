import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel-activator"
export default class extends Controller {
  static targets = ["activate-me"]
  connect() {
    console.log('activator online')
  }
  activate() {
    elements = document.querySelectorAll(".activate-me");
    console.log(elements)
  }
}
