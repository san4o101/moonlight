
//= require components/jquery.mask.min.js


$(document).on('turbolinks:load', function() {
    $('.money').mask('000000.00', {
        reverse: true,
        placeholder: "0.00",
    });

    $('.date').mask("99.99.9999", {
        placeholder: 'дд.мм.рррр'
    });
});