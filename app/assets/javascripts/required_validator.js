var validateField = function(parent){
  var span = parent.find('span');
  var input = parent.find('input');
    var textarea = parent.find('textarea');
    console.log("input " + input.val());
  var resultInput = isValidValue(input);
  var resultTextArea = isValidValue(textarea);
    console.log("resultInput " + resultInput);
    console.log("resultTextArea " + resultTextArea);

    if(resultInput || resultTextArea){
    setMessageAndClass(span, '', 'error');
  }else{
    setMessageAndClass(span, 'O campo é requerido', 'error_required');
  }
  return resultInput || resultTextArea;
};

var isValidValue = function(element) {
    console.log("element " + !!element.val());
  return !!element.val();
};
