describe('ErrorFormatter', function() {
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

