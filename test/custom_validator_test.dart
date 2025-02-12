import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('CustomValidator - Password Validation', () {
    final passwordValidator = V.custom()..addRule((value) => (value ?? "").isEmpty ? "Cannot be empty" : null);
    test('Should fail if password is null', () {
      expect(passwordValidator.validate(null), "Password is required");
    });

    test('Should fail if password is empty', () {
      expect(passwordValidator.validate(""), "Password is required");
    });

    test('Should fail if password is less than 8 characters', () {
      expect(passwordValidator.validate("Short1"), "Password must be at least 8 characters");
    });

    test('Should fail if password has no uppercase letter', () {
      expect(passwordValidator.validate("testpassword1"), "Must contain an uppercase letter");
    });

    test('Should fail if password has no number', () {
      expect(passwordValidator.validate("TestPassword"), "Must contain a number");
    });

    test('Should pass for a valid password', () {
      expect(passwordValidator.validate("TestPass1"), null);
    });
  });
}
