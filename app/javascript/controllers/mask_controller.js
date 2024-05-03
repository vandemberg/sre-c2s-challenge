import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("input", this.formatPhoneNumber.bind(this));
  }

  formatPhoneNumber(event) {
    const phoneNumber = event.target.value.replace(/\D/g, "");
    const formattedPhoneNumber = this.format(phoneNumber);
    event.target.value = formattedPhoneNumber;
  }

  format(phoneNumber) {
    const match = phoneNumber.match(/^(\d{0,2})(\d{0,5})(\d{0,4})$/);
    if (match) {
      return !match[2]
        ? match[1]
        : "(" +
            match[1] +
            ") " +
            match[2] +
            (match[3] ? "-" + match[3] : "");
    }
    return phoneNumber;
  }
}
