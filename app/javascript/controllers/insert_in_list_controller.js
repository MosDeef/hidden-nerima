import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log(this.element);
    console.log(this.itemsTarget);
    console.log(this.formTarget);
    console.log(this.getMetaValue('csrf-token'))

  }
  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)

    })
    .then(response => response.json())
    .then((data) => {
      if (data.inserted_item) {
        console.log(data)
        this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
      }
      this.formTarget.outerHTML = data.form
    })
  }
}
