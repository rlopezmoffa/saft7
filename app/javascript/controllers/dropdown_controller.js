import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {

  static targets = ["submit"]

  connect() {
    console.log("---Connect dropdown---", this.element)       
  }

  submit() {
    console.log("---Reload page---", this.element)
    // this.element.requestSubmit();
  }
}
