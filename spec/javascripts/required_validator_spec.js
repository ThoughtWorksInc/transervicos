describe('Required Validator', function() {

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

  describe('#validateField', function() {
    it('should set message and class error when the input has a empty value', function() {
      var parent = $('<div><input /><span class="error"/></div>')
      validateField(parent);
      var span = parent.find('span');
      expect(span).toHaveClass('error_required');
      expect(span).toContainText('O campo é requerido');
    });

    it('should not change class and message when the input has a valid value', function () {
      var parent = $('<div><input value="Some value"/><span class="error_required">Error message</span></div>');
      validateField(parent);
      var span = parent.find('span');
      expect(span).toHaveClass('error');
      expect(span).toContainText('');
    });
  });

    describe('#validateTextArea', function () {
        it('should set message and class error when the textarea has a empty value', function () {
            var parent = $('<div><textarea /><span class="error"/></div>')
            validateTextArea(parent);
            var span = parent.find('span');
            expect(span).toHaveClass('error_required');
            expect(span).toContainText('O campo é requerido');
        });
    });
});
