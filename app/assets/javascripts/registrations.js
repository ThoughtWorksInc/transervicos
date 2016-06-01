var registrations = {

  hello: function () {
   //$(document).ready(function(){
     //$('#new_user input').focusout(function(){
       //showErrorMessage(this, 'O campo é requerido');
     //});

     //var showErrorMessage = function(element, message){
       //var input = $(element);
       //var element_value = input.val();
       //var error_element=$("span", input.parent());
       //if(!element_value){
         //error_element.removeClass("error").addClass("error_required");
         //error_element.html(message);
       //}else{
         //error_element.removeClass("error_required").addClass("error");
         //error_element.html('');
       //}
     //};
   //});
    return true;
  }
}

var showErrorMessage = function(element, message) {
  element.html(message);
}

var changeClass = function(element, clazz) {
  var actualClazz = element.attr("class");
  element.removeClass(actualClazz);
  element.addClass(clazz);
}

var isValidValue = function(elementId) {
  return ($(elementId).val())? true: false;
}


