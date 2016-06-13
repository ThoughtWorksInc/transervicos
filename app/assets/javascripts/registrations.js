$(document).ready(function() {
  $('#new_user input').focusout(function() {
    validateField($(this).parent());
  });

  $('#user_email').focusout(function() {
    if(isValidValue($(this))){
      executeValidation($(this).parent());
    }
  });
});
