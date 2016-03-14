//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require jasny-bootstrap.min

(function($, window, document) {
  'use strict';

  $(function() {
    $('select[data-option-dependent=true]').each(function () {
      var _this = $(this);
      var subareaSelectId = _this.attr('id');
      var areaSelectId = _this.data('option-observed');
      var optionsDocumentUrl = _this.data('option-url');
      var optionValue = _this.data('option-key-method');
      var optionText = _this.data('option-value-method');
      var subareaDefaultOption = _this.has('option[value=\'\']').size() ? _this.find('option[value=\'\']') : $('<option value=\'\'>').text('Selecione uma subárea');
      var subareaElement = $('select#' + subareaSelectId);
      var areaElement = $('#' + areaSelectId);

      if (!subareaElement.val() && areaElement.size() > 1) {
        subareaElement.attr('disabled', true);
      }

      areaElement.on('change', function() {
        var regexp = /:[0-9a-zA-Z_]+:/g;
        subareaElement.empty().append(subareaDefaultOption);
        if (areaElement.val()) {
          var url = optionsDocumentUrl.replace(regexp, areaElement.val());
          $.getJSON(url, function(data) {
            subareaElement.append(buildOptions(data, optionValue, optionText));
            subareaElement.attr('disabled', false);
          });
        }
      });
    });

    var buildOptions = function(collection, valueAttr, textAttr) {
      var options = [];
      $.each(collection, function(index, object) {
        options.push($('<option/>').val(object[valueAttr]).text(object[textAttr]));
      });
      return options;
    };

    var loadCitiesForState = function(){
      var stateId = $('#state-selector').find("option:selected").val();
      var citySelector = $('#city-selector');
      if (stateId === '') {
        citySelector.attr('disabled', true);
      } else {
        var url = '/state/' + stateId;
        $.getJSON(url, function(data) {
          citySelector.html($('<option/>').val('').text('Selecione uma cidade'));
          citySelector.append(buildOptions(data['cities'], 'id', 'name'));
          citySelector.removeAttr('disabled');
        }).done(function(){
            var cityId = citySelector.data('selected-city');
            if (cityId) {
                citySelector.find('option[value=' + cityId + ']').attr('selected','selected');
            }
        });
      }
    };

    $('#user_birth_date').inputmask({
      mask: '99/99/9999'
    });

    $('#user_phone_number, #service_phone, #service_other_phone').inputmask({
      mask: '(99) 9999?99999'
    });

    if ($('#user_social_name').val() === '') {
      $('#user_name_preference_social').attr('disabled', true);
    }

    if ($('#user_civil_name').val() === '') {
      $('#user_name_preference_civil').attr('disabled', true);
    }

    $('#state-selector').on('change', loadCitiesForState);
    loadCitiesForState();
  });

}(window.jQuery, window, document));
