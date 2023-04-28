import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="create-form"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("hello");
  }
  send(event) {
    event.preventDefault()

    console.log("TODO: send request in AJAX")
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
