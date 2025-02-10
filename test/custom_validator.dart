import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('CustomValidator - Password Validation', () {
    final passwordValidator = V.custom().addRules((value) {
      if (value == null || value.isEmpty) return "Password is required";
      if (value.length < 8) return "Password must be at least 8 characters";
      if (!RegExp(r'[A-Z]').hasMatch(value)) return "Must contain an uppercase letter";
      if (!RegExp(r'[0-9]').hasMatch(value)) return "Must contain a number";
      return null; // Valid
    });

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
