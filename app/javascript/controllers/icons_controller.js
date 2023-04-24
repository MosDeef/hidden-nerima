import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  fill(e) {
    e.preventDefault();
    this.element.classList.remove();
    this.element.classList.remove(this.fa - solid);
  }

}



/* <i class="fa-solid fa-bookmark"></i> */
