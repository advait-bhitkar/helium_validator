import 'dart:math';

import '../validator.dart';

/// `NumberValidator` provides validation rules for numeric values.
class NumberValidator extends Validator<num> {
  /// Ensures the value is not null.
  NumberValidator required({String message = "Field is required"}) {
    return addRule((value) {
      if (value == null) return message;
      return null;
    }) as NumberValidator;
  }

  /// Ensures the value is at least [minValue].
  NumberValidator min(num minValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value < minValue) ? "Must be at least $minValue" : null;
    }) as NumberValidator;
  }

  /// Ensures the value is at most [maxValue].
  NumberValidator max(num maxValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value > maxValue) ? "Must be at most $maxValue" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is greater than zero.
  NumberValidator positive() {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value <= 0) ? "Must be positive" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is less than zero.
  NumberValidator negative() {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value >= 0) ? "Must be negative" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is not zero.
  NumberValidator notZero({String message = "Must not be zero"}) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value == 0) ? message : null;
    }) as NumberValidator;
  }

  /// Ensures the number is even (integer only).
  NumberValidator even() {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      if (value % 2 != 0) return "Must be an even number";
      return null;
    }) as NumberValidator;
  }

  /// Ensures the number is odd (integer only).
  NumberValidator odd() {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      if (value % 2 == 0) return "Must be an odd number";
      return null;
    }) as NumberValidator;
  }

  /// Ensures the number has at most [decimalPlaces] decimal places.
  NumberValidator precision(int decimalPlaces) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";

      final String numString = value.toString();
      final int decimalIndex = numString.indexOf('.');
      if (decimalIndex == -1) return null; // No decimal, it's an integer

      final int actualPrecision = numString.length - decimalIndex - 1;
      return (actualPrecision > decimalPlaces)
          ? "Must have at most $decimalPlaces decimal places"
          : null;
    }) as NumberValidator;
  }

  /// Ensures the number is finite (not NaN or infinity).
  NumberValidator isFinite() {
    return addRule((value) {
      if (value == null || value.isInfinite || value.isNaN) {
        return "Must be a finite number";
      }
      return null;
    }) as NumberValidator;
  }

  /// Ensures the number is a whole number (integer).
  NumberValidator isWholeNumber() {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value % 1 != 0) ? "Must be a whole number" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is between [minValue] and [maxValue], inclusive.
  NumberValidator between(num minValue, num maxValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value < minValue || value > maxValue)
          ? "Must be between $minValue and $maxValue"
          : null;
    }) as NumberValidator;
  }

  /// Ensures the numeric string is a palindrome.
  NumberValidator isPalindrome({String message = "Number is not a palindrome"}) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";

      final String numStr = value.toString().replaceAll('.', '');
      final String reversed = numStr.split('').reversed.join('');
      return (numStr == reversed) ? null : message;
    }) as NumberValidator;
  }

  /// Ensures the number is a prime number.
  NumberValidator isPrime({String message = "Must be a prime number"}) {
    return addRule((value) {
      if (value == null || value < 2 || value % 1 != 0) return message;

      for (int i = 2; i <= sqrt(value).toInt(); i++) {
        if (value % i == 0) return message;
      }
      return null;
    }) as NumberValidator;
  }
  /// Ensures the number is exactly equal to [targetValue].
  NumberValidator equalTo(num targetValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value == targetValue) ? null : "Must be equal to $targetValue";
    }) as NumberValidator;
  }

  /// Ensures the number is not equal to [targetValue].
  NumberValidator notEqualTo(num targetValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value == targetValue) ? "Must not be $targetValue" : null;
    }) as NumberValidator;
  }

  /// Ensures the absolute value of the number is within a limit.
  NumberValidator absoluteValueMax(num maxValue) {
    return addRule((value) {
      if (value == null) return "Must be a valid number";
      return (value.abs() > maxValue)
          ? "Absolute value must be at most $maxValue"
          : null;
    }) as NumberValidator;
  }

  @override
  num? parseValue(String? input) {
    return num.tryParse(input ?? "");
  }
}
