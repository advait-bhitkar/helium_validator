import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
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
