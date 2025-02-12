import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('StringValidator - required() with custom message', () {
    final defaultValidator = V.string().required();
    final customValidator = V.string().required(message: "This field cannot be empty");

    test('should return null when value is a non-empty string', () {
      expect(defaultValidator.validate('Hello'), isNull);
    });

    test('should return default error message when value is null', () {
      expect(defaultValidator.validate(null), "Field is required");
    });

    test('should return default error message when value is an empty string', () {
      expect(defaultValidator.validate(''), "Field is required");
    });

    /// ⚠️ Edge Cases
    test('should return default error message when value contains only whitespace', () {
      expect(defaultValidator.validate('   '), "Field is required");
    });

    test('should return null for a string with whitespace but containing characters', () {
      expect(defaultValidator.validate('  Hello  '), isNull);
    });

    /// 📝 **Custom Message Tests**
    test('should return custom error message when value is null', () {
      expect(customValidator.validate(null), "This field cannot be empty");
    });

    test('should return custom error message when value is an empty string', () {
      expect(customValidator.validate(''), "This field cannot be empty");
    });

    test('should return custom error message when value contains only whitespace', () {
      expect(customValidator.validate('   '), "This field cannot be empty");
    });

    /// 🔗 **Chained Validation**
    test('should work correctly when chaining required() and minLength()', () {
      final chainValidator = StringValidator().required().minLength(3);

      expect(chainValidator.validate(''), "Field is required");
      expect(chainValidator.validate('Hi'), "Must be at least 3 characters");
      expect(chainValidator.validate('Hello'), isNull);
    });
  });

  group('StringValidator Tests', () {
    test('required() - should return error when value is null or empty', () {
      final validator = V.string().required();
      expect(validator.validate(null), "Field is required");
      expect(validator.validate(""), "Field is required");
    });

    test('minLength() - should return error if length is less than required', () {
      final validator = V.string().minLength(5);
      expect(validator.validate("abc"), "Must be at least 5 characters");
      expect(validator.validate("hello"), null);
    });

    test('maxLength() - should return error if length exceeds limit', () {
      final validator = V.string().maxLength(5);
      expect(validator.validate("abcdef"), "Must be at most 5 characters");
      expect(validator.validate("hello"), null);
    });

    test('email() - should validate email format', () {
      final validator = V.string().email();
      expect(validator.validate("test@example.com"), null);
      expect(validator.validate("invalid-email"), "Invalid email");
    });

    test('url() - should validate URL format', () {
      final validator = V.string().url();
      expect(validator.validate("https://example.com"), null);
      expect(validator.validate("not_a_url"), "Invalid URL");
    });

    test('uuid() - should validate UUID format', () {
      final validator = V.string().uuid();
      expect(validator.validate("123e4567-e89b-12d3-a456-426614174000"), null);
      expect(validator.validate("invalid-uuid"), "Invalid UUID");
    });

    test('json() - should validate JSON strings', () {
      final validator = V.string().json();
      expect(validator.validate('{"name": "John"}'), null);
      expect(validator.validate("Invalid JSON"), "Invalid JSON");
    });

    test('alpha() - should allow only alphabetic characters', () {
      final validator = V.string().alpha();
      expect(validator.validate("Hello"), null);
      expect(validator.validate("Hello123"), "Must contain only letters");
    });

    test('alphanumeric() - should allow only letters and numbers', () {
      final validator = V.string().alphanumeric();
      expect(validator.validate("Hello123"), null);
      expect(validator.validate("Hello@123"), "Must contain only letters and numbers");
    });

    test('creditCard() - should validate credit card numbers', () {
      final validator = V.string().creditCard();
      expect(validator.validate("4111 1111 1111 1111"), null);
      expect(validator.validate("1234 5678 9012 3456"), "Invalid credit card");
    });

    test('hexColor() - should validate HEX color codes', () {
      final validator = V.string().hexColor();
      expect(validator.validate("#ff5733"), null);
      expect(validator.validate("#xyz123"), "Invalid HEX color");
    });

    test('isPalindrome() - should validate palindromes', () {
      final validator = V.string().isPalindrome();
      expect(validator.validate("madam"), null);
      expect(validator.validate("hello"), "String is not a palindrome");
    });
  });
}
