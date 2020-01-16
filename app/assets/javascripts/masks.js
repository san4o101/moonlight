
//= require components/jquery.mask.min.js


$(document).on('turbolinks:load', function() {
    $('.money').mask('000000.0', {
        reverse: true,
        placeholder: "0.0",
    });

    $('.date').mask("99.99.9999", {
        placeholder: 'дд.мм.рррр'
    });

    $('.card_number').mask("0000 0000 0000 0000", {
        placeholder: '0000 0000 0000 0000'
    });

    $('.percent').mask('XZ.Y', {
        reverse: true,
        placeholder: "00.0",
        translation: {
            X: { pattern: /^[1-9]$/ },
            Z: { pattern: /^[0-9]?$/ },
            Y: { pattern: /^[0-9]$/ }
        }
    });

});