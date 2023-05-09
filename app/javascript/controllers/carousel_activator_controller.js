import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel-activator"
export default class extends Controller {
  connect() {
    console.log('activator online');
    console.log('hi');
    let elements = document.querySelectorAll(".activate-me");
    console.log(elements[0])
    elements.forEach(element => {
      console.log(element.firstChildElement);
      element.firstElementChild.classList.add('active')
    });

  }

}
