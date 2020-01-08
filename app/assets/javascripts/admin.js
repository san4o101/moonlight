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
//= require application

$(document).on('turbolinks:load', function() {

    let CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
    let manager_notification_admin = $('#manager_notification_admin');
    let manager_notification_admin_id = $('#manager_notification_admin_id');

    manager_notification_admin.autocomplete({
        source: function (request, response) {
            let request_admin = request.term;
            $.ajax({
                headers: {
                    'X-CSRF-Token': CSRF_TOKEN
                },
                type: "POST",
                url: "/admin/autocomplete_admin",
                dataType: 'json',
                data: {name: request_admin},
                success: function(suggestion){
                    response( $.map( suggestion.admin, function( result ) {
                        return {
                            label: result.full_name,
                            id: result.id
                        }
                    }));
                }
            });
        },
        position: {  collision: "flip"  },
        select: function( event, suggestions ) {
            manager_notification_admin_id.val(suggestions.item.id);
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

});