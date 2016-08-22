$(document).ready(function() {

    var emailField = $('#report_email');
    var descriptionField = $('#description');
    var authorizeBox = $('#authorize-report');

    emailField.focusout(function() {
        validateField($(this).parent());
    });

    descriptionField.focusout(function() {
        validateField($(this).parent());
    });

    emailField.focusout(function() {
        validateEmailField(this);
    });

    $('#report_service_form :submit').click(function(event) {
        var $inputs = [emailField, descriptionField, authorizeBox];
        var fails = 0;

        $inputs.each(function() {
            if(!validateField($(this).parent())){
                fails++;
            }
        });

        if(!!fails || (validateEmailField(emailField) == false)){
            event.preventDefault();
        }else{
            $('#report_service_form').submit();
        }
    });
});

var validateEmailField = function (email) {
    if(isValidValue($(email))){
        return executeValidation($(email).parent());
    }
}


// $(document).ready(function() {
//
//     $('#btn-submit').click(function(event){
//         console.log("clicou");
//         if(validateEmailField() && validateReportAuthorization()){
//             console.log("ta tudo certo");
//             $('#report_service_form').submit();
//         } else{
//             console.log("ooops");
//
//         }
//
//
//     });
//
//     // validateEmailField();
//     // validateReportAuthorization();
// });
//
// var validateEmailField = function () {
//     var span = $('.error');
//
//     $('#report_email').on('input', function() {
//         if(isValidValue($('#report_email'))){
//             if(validateEmail($('#report_email').val())){
//                 setMessageAndClass(span, '', 'error');
//                 return true;
//             }
//             else {
//                 setMessageAndClass(span, "E-mail incorreto", 'error_required');
//                 return false;
//             }
//         }
//     });
// }
//
// var validateReportAuthorization = function(){
//
//     var authorizeSpan = $('.authorize-error');
//     $('#authorize-report').on('input', function() {
//         if ($('#authorize-report:checked').length > 0) {
//             console.log("is checked");
//             setMessageAndClass(authorizeSpan, '', 'authorize-error');
//             return true;
//         } else {
//             console.log("unchecked");
//             setMessageAndClass(authorizeSpan, 'Por favor, autorize o envio da denúncia', 'error_required');
//             return false;
//         }
//     });
// }