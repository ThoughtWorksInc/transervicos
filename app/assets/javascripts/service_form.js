(function($, window, document) {
  'use strict';

  $(function() {
    var stateSelector = $('#state-selector');
    var citySelector = $('#city-selector');

    var buildOptions = function(collection, valueAttr, textAttr) {
      var options = [];
      $.each(collection, function(index, object) {
        options.push($('<option/>').val(object[valueAttr]).text(object[textAttr]));
      });
      return options;
    };

    var loadCitiesForState = function(){
      var stateId = stateSelector.find("option:selected").val();
      if (stateId === '') {
        citySelector.attr('disabled', true);
      } else {
        var url = '/state/' + stateId;
        $.getJSON(url, function(data) {
          citySelector.html($('<option/>').text('Selecione uma cidade'));
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

    stateSelector.on('change', loadCitiesForState);

    var ready = function(){
      $('[name="prestador"]').on('change',function(){
        if ($(this).val() == 'recomendacao')
        {
          $('#dados-recomendacao').show();
          $('#service_owner_name').prop('required',true);
        }
        else
        {
          $('#dados-recomendacao').hide();
          $('#service_owner_name').val('');
          $('#service_owner_email').val('');
          $('#service_owner_name').prop('required',false);
        }
      });
      loadCitiesForState();
    };

    $(document).ready(ready);
  });

}(window.jQuery, window, document));

