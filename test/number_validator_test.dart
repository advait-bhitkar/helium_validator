import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('NumberValidator Tests', () {
    test('Required validation', () {
      final validator = V.number().required();
      expect(validator.validate(null), "Field is required");
      expect(validator.validate(""), "Field is required");
      expect(validator.validate(" "), "Field is required");
      expect(validator.validate("123"), null);
    });

    test('Min validation', () {
      final validator = V.number().min(10);
      expect(validator.validate("5"), "Must be at least 10");
      expect(validator.validate("10"), null);
      expect(validator.validate("15"), null);
    });

    test('Max validation', () {
      final validator = V.number().max(20);
      expect(validator.validate("25"), "Must be at most 20");
      expect(validator.validate("20"), null);
      expect(validator.validate("15"), null);
    });

    test('Positive number validation', () {
      final validator = V.number().positive();
      expect(validator.validate("-5"), "Must be positive");
      expect(validator.validate("0"), "Must be positive");
      expect(validator.validate("10"), null);
    });

    test('Negative number validation', () {
      final validator = V.number().negative();
      expect(validator.validate("5"), "Must be negative");
      expect(validator.validate("0"), "Must be negative");
      expect(validator.validate("-10"), null);
    });

    test('Not zero validation', () {
      final validator = V.number().notZero();
      expect(validator.validate("0"), "Must not be zero");
      expect(validator.validate("10"), null);
      expect(validator.validate("-10"), null);
    });

    test('Multiple of validation', () {
      final validator = V.number().multipleOf(5);
      expect(validator.validate("10"), null);
      expect(validator.validate("15"), null);
      expect(validator.validate("12"), "Must be a multiple of 5");
    });

    test('Even number validation', () {
      final validator = V.number().even();
      expect(validator.validate("2"), null);
      expect(validator.validate("4"), null);
      expect(validator.validate("3"), "Must be an even number");
    });

    test('Odd number validation', () {
      final validator = V.number().odd();
      expect(validator.validate("1"), null);
      expect(validator.validate("3"), null);
      expect(validator.validate("4"), "Must be an odd number");
    });

    test('Precision validation', () {
      final validator = V.number().precision(2);
      expect(validator.validate("10.12"), null);
      expect(validator.validate("10.123"), "Must have at most 2 decimal places");
      expect(validator.validate("5"), null);
    });

    test('Finite number validation', () {
      final validator = V.number().isFinite();
      expect(validator.validate("10"), null);
      expect(validator.validate("NaN"), "Must be a finite number");
      expect(validator.validate("Infinity"), "Must be a finite number");
    });

    test('Whole number validation', () {
      final validator = V.number().isWholeNumber();
      expect(validator.validate("10"), null);
      expect(validator.validate("10.5"), "Must be a whole number");
      expect(validator.validate("-3"), null);
    });

    test('Between validation', () {
      final validator = V.number().between(10, 20);
      expect(validator.validate("5"), "Must be between 10 and 20");
      expect(validator.validate("15"), null);
      expect(validator.validate("25"), "Must be between 10 and 20");
    });

    test('Invalid number handling', () {
      final validator = V.number().min(10);
      expect(validator.validate("abc"), "Must be a valid number");
      expect(validator.validate(""), "Must be a valid number");
    });
  });
}
