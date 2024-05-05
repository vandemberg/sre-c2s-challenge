


$(document).ready(function() {
  $('#lead_phone').on('input', function() {
    var number = $(this).val().replace(/\D/g, '');
    var formattedNumber = '';

    if (number.length >= 1) {
      formattedNumber += '(' + number.substring(0, 2) + ')';
    }
    if (number.length > 2 && number.length <= 6) {
      formattedNumber += ' ' + number.substring(2, 6);
    } else if (number.length > 6) {
      formattedNumber += '-' + number.substring(6, 10);
    }

    $(this).val(formattedNumber);
  });
});












