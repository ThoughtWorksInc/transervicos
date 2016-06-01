//= require jquery

describe('Registrations', function() {

  it('should show error message', function() {
    var target_element = { html: function() {} };
    var message = 'xxxxxx';
    spyOn(target_element, 'html');
    showErrorMessage(target_element, message);
    expect(target_element.html).toHaveBeenCalledWith(message);
  });

  it('should change css class of an element', function() {
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

  describe('#isValidValue', function() {
    var elementId = "targetElement";

    afterEach(function(){
      expect($.fn.val).toHaveBeenCalled();
    });

    it('should return true if an element has a not empty value', function() {
      spyOn($.fn, "val").and.returnValue('someValue');
      var response = isValidValue(elementId);
      expect(response).toBeTruthy();
    });

    it('should return false if an element has a null value', function() {
      spyOn($.fn, "val").and.returnValue('');
      var response = isValidValue(elementId);
      expect(response).toBeFalsy();
    });
  });

});
