$(document).ready(function() {
  $('#new_user input').on(function() {
    validateField(this);
    console.log('xxxxx');
  });
});

var validateField = function(input){
  var span = $('span', input.parent());
  if(isValidValue(input)){
    setMessageAndClass(span, '', 'error');
  }else{
    setMessageAndClass(span, 'O campo é requerido', 'error-required');
  }
}

var isValidValue = function(element) {
  return !!element.val();
}

var setMessageAndClass = function(element, message, clazz) {
  element.html(message);
  var actualClazz = element.attr("class");
  element.removeClass(actualClazz);
  element.addClass(clazz);
}
