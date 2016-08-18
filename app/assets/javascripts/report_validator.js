$(document).ready(function() {
    var span = $('.error');

    $('#report_email').focusout(function() {
        console.log("entrou aqui");
        if(isValidValue($(this))){
            if(validateEmail($(this).val())){
                setMessageAndClass(span, '', 'error');
            }
            else {
                setMessageAndClass(span, "E-mail incorreto", 'error_required');
            }
        }
    });
});