var validateField = function(parent){
  var span = parent.find('span');
  var input = parent.find('input');
  var result = isValidValue(input);
  if(result){
    setMessageAndClass(span, '', 'error');
  }else{
    setMessageAndClass(span, 'O campo é requerido', 'error_required');
  }
  return result;
};

var isValidValue = function(element) {
  return !!element.val();
};
