import '../validator.dart';

/// `NumberValidator` provides validation rules for numeric values.
class NumberValidator extends Validator<String> {
  /// Ensures the value is not null.
  NumberValidator required({String message = "Field is required"}) {
    return addRule((value) {
      if (value == null || (value.trim().isEmpty)) {
        return message;
      }
      return null;
    }) as NumberValidator;
  }

  /// Ensures the value is at least [minValue].
  NumberValidator min(num minValue) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue < minValue ? "Must be at least $minValue" : null;
    }) as NumberValidator;
  }

  /// Ensures the value is at most [maxValue].
  NumberValidator max(num maxValue) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue > maxValue ? "Must be at most $maxValue" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is greater than zero.
  NumberValidator positive() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue <= 0 ? "Must be positive" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is less than zero.
  NumberValidator negative() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue >= 0 ? "Must be negative" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is not zero.
  NumberValidator notZero({String message = "Must not be zero"}) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue == 0 ? message : null;
    }) as NumberValidator;
  }

  /// Ensures the number is a multiple of [factor].
  NumberValidator multipleOf(num factor) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue % factor != 0 ? "Must be a multiple of $factor" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is even (integer only).
  NumberValidator even() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue % 2 != 0 ? "Must be an even number" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is odd (integer only).
  NumberValidator odd() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue % 2 == 0 ? "Must be an odd number" : null;
    }) as NumberValidator;
  }

  /// Ensures the number has at most [decimalPlaces] decimal places.
  NumberValidator precision(int decimalPlaces) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";

      final String numString = numValue.toString();
      final int decimalIndex = numString.indexOf('.');
      if (decimalIndex == -1) return null; // No decimal, it's an integer

      final int actualPrecision = numString.length - decimalIndex - 1;
      return actualPrecision > decimalPlaces
          ? "Must have at most $decimalPlaces decimal places"
          : null;
    }) as NumberValidator;
  }

  /// Ensures the number is finite (not NaN or infinity).
  NumberValidator isFinite() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null || numValue.isInfinite || numValue.isNaN) {
        return "Must be a finite number";
      }
      return null;
    }) as NumberValidator;
  }

  /// Ensures the number is a whole number (integer).
  NumberValidator isWholeNumber() {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return numValue % 1 != 0 ? "Must be a whole number" : null;
    }) as NumberValidator;
  }

  /// Ensures the number is between [minValue] and [maxValue], inclusive.
  NumberValidator between(num minValue, num maxValue) {
    return addRule((value) {
      final num? numValue = _parseNumber(value);
      if (numValue == null) return "Must be a valid number";
      return (numValue < minValue || numValue > maxValue)
          ? "Must be between $minValue and $maxValue"
          : null;
    }) as NumberValidator;
  }

  /// Helper method to parse a number from a String or num
  num? _parseNumber(dynamic value) {
    if (value is num) return value; // Already a number
    if (value is String) return num.tryParse(value); // Convert string to num
    return null; // Invalid type
  }

  /// Ensures the numeric string is a palindrome.
  NumberValidator isPalindrome({String message = "Number is not a palindrome"}) {
    return addRule((value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }

      final String numStr = value.toString();
      final String reversed = numStr.split('').reversed.join('');

      return numStr == reversed ? null : message;
    }) as NumberValidator;
  }
}
