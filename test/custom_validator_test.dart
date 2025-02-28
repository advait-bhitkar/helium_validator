import 'package:flutter_test/flutter_test.dart';
import 'package:helium_validator/helium_validator.dart';

void main() {
  group('CustomValidator - Password Validation', () {
    final passwordValidator = V.custom()
      ..addRule((value) => (value ?? "").isEmpty ? "Password is required" : null)
      ..addRule((value) => (value?.length ?? 0) < 8 ? "Password must be at least 8 characters" : null)
      ..addRule((value) => !RegExp(r'[A-Z]').hasMatch(value ?? "") ? "Must contain an uppercase letter" : null)
      ..addRule((value) => !RegExp(r'[0-9]').hasMatch(value ?? "") ? "Must contain a number" : null)
      ..addRule((value) => !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value ?? "") ? "Must contain a special character" : null)
      ..addRule((value) => _hasConsecutiveChars(value ?? "") ? "Password must not contain consecutive characters" : null)
      ..addRule((value) => _isCommonPassword(value ?? "") ? "Password is too common" : null);

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

    test('Should fail if password has no special character', () {
      expect(passwordValidator.validate("TestPassword1"), "Must contain a special character");
    });

    test('Should fail if password contains consecutive characters', () {
      expect(passwordValidator.validate(returnAllErrors: true, "abc123"), contains("Password must not contain consecutive characters"));
    });

    test('Should pass for a valid password', () {
      expect(passwordValidator.validate("TestPass1@"), null);
    });
  });
}

// Helper method to check for consecutive characters
bool _hasConsecutiveChars(String value) {
  for (int i = 0; i < value.length - 2; i++) {
    if (value.codeUnitAt(i) + 1 == value.codeUnitAt(i + 1) && value.codeUnitAt(i + 1) + 1 == value.codeUnitAt(i + 2)) {
      return true;
    }
  }
  return false;
}

// Helper method to check if the password is a common password
bool _isCommonPassword(String value) {
  const commonPasswords = [
    "password", "123456", "123456789", "qwerty", "abc123", "password1", "12345", "letmein", "welcome", "admin"
  ];
  return commonPasswords.contains(value.toLowerCase());
}
