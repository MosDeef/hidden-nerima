import { Controller } from "@hotwired/stimulus"
document.querySelector('.icons').innerHTML.addEventListener('click', fill).innerHTML;
export default class extends Controller {
  fill(e) {
    const tgt = e.target.firstElementChild;
    tgt.classList.toggle('fa-solid');
    tgt.classList.toggle('fa-regular');
  }

}



/* <i class="fa-solid fa-bookmark"></i> */
