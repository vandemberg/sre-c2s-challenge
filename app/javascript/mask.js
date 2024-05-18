import Inputmask from "inputmask";

document.addEventListener("DOMContentLoaded", () => {
  const phoneInput = document.querySelector("input[type='tel']");
  if (phoneInput) {
    Inputmask("(99) 99999-9999").mask(phoneInput);
  }
});
