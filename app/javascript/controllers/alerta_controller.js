import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const duration = 1500
    setTimeout(() => {
      this.element.style.transition = "opacity 0.5s ease-out"
      this.element.style.opacity = 0
      setTimeout(() => this.element.remove(), 500)
    }, duration)
  }
}
