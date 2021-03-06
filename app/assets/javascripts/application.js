// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require components/jquery-ui.min.js
//= require masks.js
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.uk.js

$(document).on('turbolinks:load', function() {
    $('[data-toggle="tooltip"]').tooltip();

    let CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
    let user_city = $('#user_city');
    let user_city_id = $('#user_cities_id');
    let basic_phone_number = $('#basic-phone_number');
    let phone_group__div = $('.phone-group__div');
    let card = $('.card-width');
    let copy_icon = $('.copy-icon');
    let fast_buttons__div = $('.fast-buttons');
    let money = $('.money');

    user_city.autocomplete({
        source: function (request, response) {
            let request_city = request.term;
            $.ajax({
                type: "POST",
                url: "/autocomplete_city",
                dataType: 'json',
                data: {city: request_city},
                success: function(suggestion){
                    response( $.map( suggestion.city, function( result ) {
                        return {
                            label: '(+' + result.phone_code + ' ' + result.country_name + ') ' + result.name,
                            id: result.id,
                            country_id: result.country_id,
                            country_name: result.country_name,
                            phone_code: result.phone_code,
                            value: result.name,
                        }
                    }));
                }
            });
        },
        position: {  collision: "flip"  },
        select: function( event, suggestions ) {
            user_city_id.val(suggestions.item.id);
            basic_phone_number.text('+' + suggestions.item.phone_code);
            phone_group__div.removeClass('d-none');
        },
        create: function () {
            $(this).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
                return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append(item.label)
                    .appendTo( ul );
            };
        }
    });

    $(".active_table__tr").on('click', function (e) {
        window.location = $(this).data('location');
        return true;
    });

    card.on('click', function(e) {
        let target = $(e.target);
        if(!target.hasClass('copy-icon') && !target.hasClass('open-card'))
            $(this).toggleClass('is-flipped');
    });

    copy_icon.on('click', function (e) {
        let _this = $(this);
        let card = _this.data('card');
        if (typeof card !== 'undefined')
            card = _this.data('card');
        else
            card = '';
        _this.tooltip({
            trigger: 'click',
            placement: 'top'
        });
        let number = _this.closest('.card').find('span.card-number' + card)
            .text().replace(/\s/g, '');
        copy_text(number);
        setTooltip(_this, 'Номер карти скопійовано!');
        hideTooltip(_this);
    });

    fast_buttons__div.on('click', function (e) {
        let target = $(e.target);
        if(target.hasClass('btn')) {
            money.val(target.data('value'));
        }
    });

    /**
     * FUNCTIONS
     */
    function setTooltip(item, message) {
        item.tooltip('hide')
            .attr('data-original-title', message)
            .tooltip('show');
    }
    function hideTooltip(item) {
        setTimeout(function() {
            item.tooltip('hide');
        }, 1500);
    }

    function copy_text(text) {
        let tempArea = document.createElement("textarea");
        tempArea.value = text;
        document.body.appendChild(tempArea);
        tempArea.select();
        document.execCommand("Copy");
        tempArea.remove();
    }

});