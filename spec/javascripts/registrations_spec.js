describe('Registrations', function() {

  describe('#isValidValue', function() {
    it('should return true if an element does not have an empty value', function() {
      var element = $('<input value="someValue"/>')
      var response = isValidValue(element);
      expect(response).toBeTruthy();
    });

    it('should return false if an element has a null value', function() {
      var element = $('<input />')
      var response = isValidValue(element);
      expect(response).toBeFalsy();
    });
  });

  describe('#setMessageAndClass', function(){
    it('should set message and class of an element', function() {
      var element = $('<span class="error"/>');
      var message = 'Some message';
      var clazz = 'error-required';
      setMessageAndClass(element, message, clazz);
      expect(element).toHaveClass(clazz);
      expect(element).toContainText(message);
    });
  });

});
