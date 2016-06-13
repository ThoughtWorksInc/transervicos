var validateField = function(parent){
  var span = parent.find('span');
  var input = parent.find('input');
  if(isValidValue(input)){
    setMessageAndClass(span, '', 'error');
  }else{
    setMessageAndClass(span, 'O campo é requerido', 'error_required');
  }
};

var isValidValue = function(element) {
  return !!element.val();
};
