//require registrations
//require jasmine-jquery

describe('Registrations', function() {

  it('should show error message', function() {
    var target_element = { html: function() {} };
    var message = 'xxxxxx';
    spyOn(target_element, 'html');
    showErrorMessage(target_element, message);
    expect(target_element.html).toHaveBeenCalledWith(message);
  });

  it('should change css class of a element', function() {
    var target_element = { 
      removeClass: function() {},
      addClass: function() {},
      attr: function() {}
    };
    var newClass = 'someClass';
    spyOn(target_element, 'removeClass');
    spyOn(target_element, 'addClass');
    spyOn(target_element, 'attr');
    changeClass(target_element, newClass);
    expect(target_element.attr).toHaveBeenCalled();
    expect(target_element.removeClass).toHaveBeenCalled();
    expect(target_element.addClass).toHaveBeenCalledWith(newClass);
  });

  it('should return true if an element has a not empty value', function() {
    var elementId = '#targetElement';
    var targetElement = {
      val: function() { return 'someValue' }
    }
    //spyOn($.fn, elementId).andReturn(targetElement);
    var response = isValidValue(elementId);
    expect(response).toBeTruthy();
  });

});
