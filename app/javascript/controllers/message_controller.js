import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { userId: Number }
  connect() {
    const currentUserId = parseInt(document.body.dataset.currentUserId, 10);
    if (this.userIdValue === currentUserId) {
      this.element.classList.add('sent');
      this.element.classList.remove('received');
    } else {
      this.element.classList.add('received');
      this.element.classList.remove('sent');
    }
    this.element.scrollIntoView({ behavior: 'smooth' });
  }
}
