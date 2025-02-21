import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {

  double subnormal = 5e-324; // Smallest positive number in double-precision floating point

  late NumberValidator validator;

  setUp(() {
    validator = V.number();
  });

  group('validator.validate Tests', () {
    test('Valid integer numbers', () {
      expect(validator.validate('123'), null);
      expect(validator.validate('-123'), null);
      expect(validator.validate('0'), null);
      expect(validator.validate('0000123'), null);
    });

    test('Valid decimal numbers', () {
      expect(validator.validate('123.456'), null);
      expect(validator.validate('-123.456'), null);
      expect(validator.validate('0.0'), null);
      expect(validator.validate('-0.0'), null);
      expect(validator.validate('000000'), null);
    });

    test('Valid scientific notation numbers', () {
      expect(validator.validate('1e3'), null);
      expect(validator.validate('-1E3'), null);
      expect(validator.validate('1e-3'), null);
      expect(validator.validate('0e5'), null);
      expect(validator.validate('0x12'), null);
    });

    test('Invalid number formats', () {
      expect(validator.validate('abc'), "Must be a valid number");
      expect(validator.validate('123abc456'), "Must be a valid number");
      expect(validator.validate('1e-3.5'), "Must be a valid number");
      expect(validator.validate('1_000'), "Must be a valid number");
    });

    test('Handling of different data types', () {
      expect(validator.validate(true), "Must be a valid number");
      expect(validator.validate(false), "Must be a valid number");
      expect(validator.validate([]), "Must be a valid number");
      expect(validator.validate({}), "Must be a valid number");
      expect(validator.validate(Object()), "Must be a valid number");
    });

    test('Whitespace handling', () {
      expect(validator.validate('  -0  '), null);
      expect(validator.validate(' \t\n123 '), null);
    });

    test('Unicode and special characters', () {
      expect(validator.validate('１２３'), "Must be a valid number"); // Full-width digits
      expect(validator.validate('١٢٣'), "Must be a valid number"); // Arabic numerals
      expect(validator.validate('१२३'), "Must be a valid number"); // Devanagari numerals
    });

    test('Edge limit cases', () {
      expect(validator.validate(double.minPositive.toString()), null);
      expect(validator.validate((double.minPositive / 10).toString()), null);
      expect(validator.validate((double.maxFinite * 10).toString()), "Must be a valid number");
    });
  });
  group('Required Validation', () {
    test('should fail when null or empty', () {
      expect(validator.required().validate(null), "Field is required");
      expect(validator.required().validate(""), "Field is required");
      expect(validator.required().validate("   "), "Field is required");
    });

    test('should pass for valid numbers', () {
      expect(validator.required().validate("18"), null);
      expect(validator.required().validate(18), null);
      expect(validator.required().validate(" 18 "), null);
      expect(validator.required().validate("18.5"), null);
      expect(validator.required().validate("-10"), null);
      expect(validator.required().validate(-10), null);
      expect(validator.required().validate("1e3"), null);
    });

    test('should fail for non-numeric values', () {
      expect(validator.required().validate("abc"), "Must be a valid number");
      expect(validator.required().validate("18a"), "Must be a valid number");
      expect(validator.required().validate("!@#"), "Must be a valid number");
      expect(validator.required().validate("18.5.6"), "Must be a valid number");
    });

    test('should fail for NaN and Infinity', () {
      expect(validator.required().validate(double.nan), "Must be a valid number");
      expect(validator.required().validate(double.infinity), "Must be a valid number");
      expect(validator.required().validate(double.negativeInfinity), "Must be a valid number");
    });

    test('should pass for valid numbers', () {
      // Zero should be allowed
      expect(validator.required().validate("0"), null);
      expect(validator.required().validate(0), null);

      // Negative numbers should be valid
      expect(validator.required().validate("-10"), null);
      expect(validator.required().validate(-10), null);
      expect(validator.required().validate("-10.5"), null);

      // Exponential notation should be valid
      expect(validator.required().validate("1e3"), null);
      expect(validator.required().validate(1e3), null);
      expect(validator.required().validate("-1e3"), null);
    });

    test('should fail for non-numeric values', () {
      expect(validator.required().validate("abc"), "Must be a valid number");
      expect(validator.required().validate("18a"), "Must be a valid number");
      expect(validator.required().validate("18.5.6"), "Must be a valid number");
      expect(validator.required().validate(" 18a "), "Must be a valid number");
      expect(validator.required().validate("!@#"), "Must be a valid number");
    });

    test('should fail for NaN and Infinity', () {
      expect(validator.required().validate(double.nan), "Must be a valid number");
      expect(validator.required().validate(double.infinity), "Must be a valid number");
      expect(validator.required().validate(double.negativeInfinity), "Must be a valid number");
    });

    test('should handle edge cases', () {
      // Large numbers
      expect(validator.required().validate("999999999999999999999"), null);
      expect(validator.required().validate(double.maxFinite.toString()), null);

      // Numbers with leading or trailing special characters should fail
      expect(validator.required().validate("#18"), "Must be a valid number");
      expect(validator.required().validate("18#"), "Must be a valid number");
      expect(validator.required().validate("18.5%"), "Must be a valid number");

      // String that looks like a number but has extra whitespace should pass
      expect(validator.required().validate("  42 "), null);

      // Strings containing only a decimal point should fail
      expect(validator.required().validate("."), "Must be a valid number");
      expect(validator.required().validate(".."), "Must be a valid number");

      // Negative zero should be treated as valid
      expect(validator.required().validate("-0"), null);

      // Edge case: Min/max integer values
      expect(validator.required().validate("${double.minPositive}"), null);
      expect(validator.required().validate("${double.maxFinite}"), null);
      expect(validator.required().validate("${double.negativeInfinity}"), "Must be a valid number");
    });

  });

  group('Min and Max Validation', () {
    test('min - should fail when value is less than min', () {
      expect(validator.min(10).validate(5), "Must be at least 10");
      expect(validator.min(10).validate(10), isNull);
      expect(validator.min(10).validate(15), isNull);
    });

    test('max - should fail when value is greater than max', () {
      expect(validator.max(10).validate(15), "Must be at most 10");
      expect(validator.max(10).validate(10), isNull);
      expect(validator.max(10).validate(5), isNull);
    });
  });

  group('Additional Edge Cases', () {
    test('should handle extremely large and small numbers', () {
      expect(validator.required().validate("999999999999999999999"), null);
      expect(validator.required().validate(double.maxFinite), null);
      expect(validator.required().validate(subnormal), null);
    });

    test('should fail for numbers with thousands separators', () {
      expect(validator.required().validate("1,234.56"), "Must be a valid number");
    });

    test('should handle locale-specific cases', () {
      expect(validator.required().validate("1.234,56"), "Must be a valid number");
      expect(validator.required().validate("1,234.56"), "Must be a valid number");
    });

    test('should fail for strings containing only a decimal point', () {
      expect(validator.required().validate("."), "Must be a valid number");
      expect(validator.required().validate(".."), "Must be a valid number");
    });
  });
  group('Additional Edge Cases', () {
    test('min - should fail when value is less than min', () {
      expect(validator.min(10).validate(5), "Must be at least 10");
      expect(validator.min(10).validate(10), isNull);
      expect(validator.min(10).validate(null), isNull);
    });

    test('max - should fail when value is greater than max', () {
      expect(validator.max(10).validate(15), "Must be at most 10");
      expect(validator.max(10).validate(10), isNull);
      expect(validator.max(10).validate(5), isNull);
    });

    test('positive - should fail when value is negative or zero', () {
      expect(validator.positive().validate(-5), "Must be positive");
      expect(validator.positive().validate(0), "Must be positive");
      expect(validator.positive().validate(1), isNull);
    });

    test('negative - should fail when value is positive or zero', () {
      expect(validator.negative().validate(5), "Must be negative");
      expect(validator.negative().validate(0), "Must be negative");
      expect(validator.negative().validate(-1), isNull);
    });

    test('notZero - should fail when value is zero', () {
      expect(validator.notZero().validate(0), "Must not be zero");
      expect(validator.notZero().validate(1), isNull);
      expect(validator.notZero().validate(-1), isNull);
    });

    test('even - should fail when value is odd', () {
      expect(validator.even().validate(3), "Must be an even number");
      expect(validator.even().validate(2), isNull);
      expect(validator.even().validate(0), isNull);
    });

    test('odd - should fail when value is even', () {
      expect(validator.odd().validate(4), "Must be an odd number");
      expect(validator.odd().validate(3), isNull);
    });

    test('precision - should fail when value has more decimal places than allowed', () {
      expect(validator.precision(2).validate(3.1415), "Must have at most 2 decimal places");
      expect(validator.precision(2).validate(3.14), isNull);
      expect(validator.precision(2).validate(3), isNull);
    });

    test('isFinite - should fail when value is NaN or Infinity', () {
      expect(validator.isFinite().validate(double.infinity), "Must be a valid number");
      expect(validator.isFinite().validate(double.nan), "Must be a valid number");
      expect(validator.isFinite().validate(100), isNull);
    });

    test('isWholeNumber - should fail when value is not an integer', () {
      expect(validator.isWholeNumber().validate(3.5), "Must be a whole number");
      expect(validator.isWholeNumber().validate(3), isNull);
    });

    test('between - should fail when value is out of range', () {
      expect(validator.between(10, 20).validate(5), "Must be between 10 and 20");
      expect(validator.between(10, 20).validate(25), "Must be between 10 and 20");
      expect(validator.between(10, 20).validate(15), isNull);
    });

    test('isPalindrome - should fail when number is not a palindrome', () {
      expect(validator.isPalindrome().validate(123), "Number is not a palindrome");
      expect(validator.isPalindrome().validate(121), isNull);
    });

    test('isPrime - should fail when number is not prime', () {
      expect(validator.isPrime().validate(4), "Must be a prime number");
      expect(validator.isPrime().validate(7), isNull);
    });

    test('equalTo - should fail when value is not equal to target', () {
      expect(validator.equalTo(10).validate(5), "Must be equal to 10");
      expect(validator.equalTo(10).validate(10), isNull);
    });

    test('notEqualTo - should fail when value is equal to target', () {
      expect(validator.notEqualTo(10).validate(10), "Must not be 10");
      expect(validator.notEqualTo(10).validate(5), isNull);
    });

    test('absoluteValueMax - should fail when absolute value exceeds max', () {
      expect(validator.absoluteValueMax(5).validate(-10), "Absolute value must be at most 5");
      expect(validator.absoluteValueMax(5).validate(3), isNull);
    });
  });

  group('validateStrict function', () {
    test('Validates a correct number', () {
      expect(validator.validateStrict(10), isNull);
    });

    test('Returns error for invalid number', () {
      expect(validator.positive().validateStrict(-5), "Must be positive");
    });

    test('Returns error when value is null', () {
      expect(validator.validateStrict(null), "Must be a valid number");
    });

    test('Validates multiple rules with returnAllErrors', () {
      validator.addRule((num? value) =>
      value != null && value > 100 ? "Must be less than 100" : null);

      expect(validator.positive().validateStrict(-5, returnAllErrors: true),
          "Must be positive");
      expect(validator.validateStrict(150, returnAllErrors: true),
          "Must be less than 100");
    });
  });

  group('NumberValidator Tests', () {
    test('Return all errors when multiple validations fail', () {
      final validator = NumberValidator()
          .min(10, message: "Must be at least 10")
          .max(50, message: "Must be at most 50")
          .notZero()
          .even();

      final errors = validator.validate(5, returnAllErrors: true, returnAsList: true);
      expect(errors, isList);
      expect(errors, contains("Must be at least 10"));
      expect(errors, contains("Must be an even number"));
    });

    test('Returns a single error when returnAllErrors is false', () {
      final validator = NumberValidator()
          .min(10, message: "Must be at least 10")
          .max(50, message: "Must be at most 50")
          .notZero()
          .even();

      final error = validator.validate(5, returnAllErrors: false);
      expect(error, isNotNull);
      expect(error, anyOf("Must be at least 10", "Must be an even number"));
    });

    test('Valid number passes without errors', () {
      final validator = NumberValidator()
          .min(10, message: "Must be at least 10")
          .max(50, message: "Must be at most 50")
          .notZero()
          .even();

      final errors = validator.validate(20, returnAllErrors: true);
      expect(errors, isNull);
    });

    test('Handles NaN and non-numeric values correctly', () {
      final validator = NumberValidator();

      expect(validator.validate(double.nan), "Must be a valid number");
      expect(validator.validate("abc"), "Must be a valid number");
      expect(validator.validate([]), "Must be a valid number");
    });
  });
}
