// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require pickadate/picker
//= require pickadate/picker.date
//

jQuery(document).ready(function () {
    $('select[data-option-dependent=true]').each(function (i) {
        var observer_dom_id = $(this).attr("id");
        var observed_dom_id = $(this).data("option-observed");
        var url_mask = $(this).data("option-url");
        var key_method = $(this).data("option-key-method");
        var value_method = $(this).data("option-value-method");
        var prompt = $(this).has("option[value='']").size() ? $(this).find("option[value='']") : $("<option value=\"\">").text("Select a specialization");
        var regexp = /:[0-9a-zA-Z_]+:/g;
        var observer = $("select#" + observer_dom_id);
        var observed = $("#" + observed_dom_id);

        if (!observer.val() && observed.size() > 1) {
            observer.attr("disabled", true);
        }
        observed.on("change", function () {
            observer.empty().append(prompt);
            if (observed.val()) {
                url = url_mask.replace(regexp, observed.val());
                $.getJSON(url, function (data) {
                    $.each(data, function (i, object) {
                        observer.append($("<option>").attr("value", object[key_method]).text(object[value_method]));
                        observer.attr("disabled", false);
                    });
                });
            }
        });
    });
});

$(document).ready(function(){
  $("#user_birth_date").pickadate({
    today: 'Hoje',
    clear: 'Limpar',
    close: 'Fechar',
    format: 'd mmmm, yyyy',
    max: getMaximumDay(),
    selectYears: true,
    selectMonths: true,

    monthsFull: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outobro', 'Novembro', 'Dezembro'],
    monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
    weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab']
  });
});

function getMaximumDay() {
    var today = new Date();
    var maxDate = [];

    maxDate.push(today.getFullYear() - 18);
    maxDate.push(today.getMonth() + 1);
    maxDate.push(today.getDate());

    return maxDate;
}
