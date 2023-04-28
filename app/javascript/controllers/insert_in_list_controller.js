import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log('hi')
  }
  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)

    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforebegin", data.inserted_item)
        }
        this.formTarget.reset()

      })
  }
}
