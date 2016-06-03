$(document).ready(function() {
  $('#new_user input').focusout(function() {
    validateField($(this));
  });
});

var validateField = function(input){
  var span = $('span', input.parent());
  if(isValidValue(input)){
    setMessageAndClass(span, '', 'error');
  }else{
    setMessageAndClass(span, 'O campo é requerido', 'error_required');
  }
};

var isValidValue = function(element) {
  return !!element.val();
};

var setMessageAndClass = function(element, message, clazz) {
  element.html(message);
  var actualClazz = element.attr("class");
  element.removeClass(actualClazz);
  element.addClass(clazz);
};
