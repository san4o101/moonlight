
//= require components/jquery.mask.min.js


$(document).on('turbolinks:load', function() {
    $('.money').mask('###0.00', {
        reverse: true,
        placeholder: "0.00",
    });
});