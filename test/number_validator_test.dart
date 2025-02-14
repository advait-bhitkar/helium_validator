import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('NumberValidator Tests', () {
    late NumberValidator validator;

    setUp(() {
      validator = V.number();
    });

    test('required - should fail when null or empty', () {
      expect(validator.required().validate(null), "Must be a valid number");
    });

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
      expect(validator.isFinite().validate(double.infinity), "Must be a finite number");
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
}
