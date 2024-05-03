import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import Cleave from 'cleave.js';

document.addEventListener('turbolinks:load', function(){
  new Cleave('.phone', {
    phone: true,
    phoneRegionCode: 'BR',
    phoneRegionFormat: 'NATIONAL',
    delimiter: '',
    blocks: [0, 2, 5, 5, 5],
    uppercase: true

  });
});