import 'package:flutter/foundation.dart';

import '../validator.dart';
import 'dart:math';

/// A validator for numeric values, supporting various validation rules.
class NumberValidator extends Validator<num> {
  /// Creates a [NumberValidator] with a custom error message for invalid types.
  NumberValidator({super.invalidTypeMessage = "Must be a valid number"});

  /// Ensures the value is required (not null or NaN).
  NumberValidator required({String message = "Field is required"}) {
    return _addRule((value) => (value == null || value.isNaN == true) ? message : null);
  }

  /// Ensures the value is at least [minValue].
  NumberValidator min(num minValue, {String? message}) {
    return _addRule((value) => (value != null && value < minValue ? (message ?? "Must be at least $minValue") : null));
  }

  /// Ensures the value is at most [maxValue].
  NumberValidator max(num maxValue, {String? message}) {
    return _addRule((value) => (value != null && value > maxValue ? (message ?? "Must be at most $maxValue") : null));
  }

  /// Ensures the value is positive (> 0).
  NumberValidator positive({String? message}) {
    return _addRule((value) => (value != null && value <= 0 ? (message ?? "Must be positive") : null));
  }

  /// Ensures the value is negative (< 0).
  NumberValidator negative({String? message}) {
    return _addRule((value) => (value != null && value >= 0 ? (message ?? "Must be negative") : null));
  }

  /// Ensures the value is not zero.
  NumberValidator notZero({String message = "Must not be zero"}) {
    return _addRule((value) => (value != null && value == 0 ? message : null));
  }

  /// Ensures the value is an even number.
  NumberValidator even() {
    return _addRule((value) => (value != null && value % 2 != 0 ? "Must be an even number" : null));
  }

  /// Ensures the value is an odd number.
  NumberValidator odd() {
    return _addRule((value) => (value != null && value % 2 == 0 ? "Must be an odd number" : null));
  }

  /// Ensures the value has at most [decimalPlaces] decimal places.
  NumberValidator precision(int decimalPlaces) {
    return _addRule((value) {
      if (value == null) return null;
      final factor = pow(10, decimalPlaces);
      return ((value * factor).round().toDouble() / factor == value)
          ? null
          : "Must have at most $decimalPlaces decimal places";
    });
  }

  /// Ensures the value is a finite number (not infinite or NaN).
  NumberValidator isFinite() {
    return _addRule((value) => (value != null && (value.isInfinite || value.isNaN)) ? "Must be a finite number" : null);
  }

  /// Ensures the value is a whole number (integer).
  NumberValidator isWholeNumber({String? message}) {
    return _addRule((value) =>
    (value != null && value % 1 == 0 && value >= 0)
        ? null
        : (message ?? "Must be a whole number")
    );
  }

  /// Ensures the value is between [minValue] and [maxValue], inclusive.
  NumberValidator between(num minValue, num maxValue) {
    return _addRule((value) => (value != null && (value < minValue || value > maxValue) ? "Must be between $minValue and $maxValue" : null));
  }

  /// Ensures the value is a multiple of [factor].
  NumberValidator multipleOf(num factor, {String? message}) {
    return _addRule((value) {
      if (value == null) return null;
      final remainder = (value / factor) % 1;
      return (remainder.abs() < 1e-10) ? null : (message ?? "Must be a multiple of $factor");
    });
  }

  /// Ensures the value is within a safe integer range.
  NumberValidator safe({num? min, num? max, String? message}) {
    final bool isWeb = kIsWeb;
    final num minSafe = min ?? (isWeb ? -9007199254740991 : double.negativeInfinity);
    final num maxSafe = max ?? (isWeb ? 9007199254740991 : double.infinity);

    return _addRule((value) =>
    (value != null && value >= minSafe && value <= maxSafe)
        ? null
        : (message ?? "Number must be between $minSafe and $maxSafe"));
  }

  /// Ensures the number is a palindrome (reads the same forward and backward).
  NumberValidator isPalindrome({String message = "Number is not a palindrome"}) {
    return _addRule((value) {
      if (value == null) return null;
      final String numStr = value.abs().toString().replaceAll('.', '');
      final String reversed = numStr.split('').reversed.join('');
      return (numStr == reversed) ? null : message;
    });
  }

  /// Ensures the number is a prime number.
  NumberValidator isPrime({String message = "Must be a prime number"}) {
    return _addRule((value) {
      if (value == null || value < 2 || value % 1 != 0) return message;
      if (value == 2) return null;
      if (value % 2 == 0) return message;
      for (int i = 3; i <= sqrt(value).toInt(); i += 2) {
        if (value % i == 0) return message;
      }
      return null;
    });
  }

  /// Ensures the value is equal to [targetValue].
  NumberValidator equalTo(num targetValue) {
    return _addRule((value) => (value != null && value == targetValue ? null : "Must be equal to $targetValue"));
  }

  /// Ensures the value is not equal to [targetValue].
  NumberValidator notEqualTo(num targetValue) {
    return _addRule((value) => (value != null && value == targetValue ? "Must not be $targetValue" : null));
  }

  /// Ensures the absolute value is at most [maxValue].
  NumberValidator absoluteValueMax(num maxValue) {
    return _addRule((value) => (value != null && value.abs() > maxValue ? "Absolute value must be at most $maxValue" : null));
  }

  /// Parses a string input into a numeric value.
  @override
  num? parseValue(String? input) => (input == null || input.trim().isEmpty) ? null : num.tryParse(input);

  @override
  Object? validate(dynamic value, {bool returnAllErrors = false, bool returnAsList = false}) {
    if (value is String && value.trim().isEmpty) value = null;

    if (value is num) {
      if (value.isNaN || value.isInfinite) {
        return invalidTypeMessage; // "Must be a valid number"
      }
    } else if (value is String && value.isNotEmpty) {
      final parsed = num.tryParse(value);
      if (parsed == null || parsed.isInfinite) {
        return invalidTypeMessage; // "Must be a valid number"
      }
      value = parsed; // Convert valid string numbers into num
    } else if (value is bool || value is List || value is Map || value is Object) {
      return invalidTypeMessage; // Explicitly handle non-numeric types
    }

    return super.validate(value, returnAllErrors: returnAllErrors, returnAsList: returnAsList);
  }

  /// Adds a validation rule to the validator.
  NumberValidator _addRule(String? Function(num?) rule) {
    return addRule((value) => rule(value)) as NumberValidator;
  }
}
