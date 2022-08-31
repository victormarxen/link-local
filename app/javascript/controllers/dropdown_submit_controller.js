import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  change(event) {
    event.currentTarget.parentElement.submit();
  }
}
