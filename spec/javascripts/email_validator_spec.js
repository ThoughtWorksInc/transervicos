describe('EmailValidator', function() {
  describe('#validateEmail', function() {
    it('should return false if email is invalid', function() {
      var email = 'invalidValue';
      expect(validateEmail(email)).toBeFalsy();
    });
    it('should return false if email is invalid', function() {
      var email = 'someemail@email.com';
      expect(validateEmail(email)).toBeTruthy();
    });
    it('should set message and class error when the email is invalid', function() {
      var parent = $('<div><input value="invalidValue"/><span class="error"/></div>')
      executeValidation(parent);
      var span = parent.find('span');
      expect(span).toHaveClass('error_required');
      expect(span).toContainText('O e-mail informado é inválido');
    });
  });
});
