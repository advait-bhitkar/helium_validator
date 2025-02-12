import '../validator.dart';

/// A validator for boolean values, ensuring they meet specific conditions.
class BooleanValidator extends Validator<dynamic> {
  BooleanValidator();
  /// Ensures the value is `true`.
  BooleanValidator isTrue({String message = "Must be true"}) {
    return addRule((value) => value == true ? null : message) as BooleanValidator;
  }

  /// Ensures the value is `false`.
  BooleanValidator isFalse({String message = "Must be false"}) {
    return addRule((value) => value == false ? null : message) as BooleanValidator;
  }

  /// Ensures the value is truthy (e.g., "true", "yes", "on", "1").
  BooleanValidator isTruthy({String message = "Must be a truthy value"}) {
    return addRule((value) => value == true ? null : message) as BooleanValidator;
  }

  /// Ensures the value is falsy (e.g., "false", "no", "off", "0").
  BooleanValidator isFalsy({String message = "Must be a falsy value"}) {
    return addRule((value) => value == false ? null : message) as BooleanValidator;
  }

  /// Ensures the value matches a specific boolean expectation.
  BooleanValidator matches(bool expectedValue, {String? message}) {
    return addRule((value) => value == expectedValue ? null : (message ?? "Must be $expectedValue")) as BooleanValidator;
  }

  /// Ensures the value does **not** match a specific boolean expectation.
  BooleanValidator not(bool value, {String? message}) {
    return addRule((dynamic input) {
      final bool? parsed = parseValue(input?.toString());
      if (parsed == null) return "Invalid boolean value";
      return parsed != value ? null : (message ?? "Must not be $value");
    }) as BooleanValidator;
  }

  /// Ensures the value follows XOR logic with the given boolean.
  BooleanValidator xor(bool otherValue, {String message = "Must be XOR true"}) {
    return addRule((value) => (value! ^ otherValue) ? null : message) as BooleanValidator;
  }

  /// Ensures the value is exactly equal to the expected boolean.
  BooleanValidator equals(bool expected, {String message = "Must match expected value"}) {
    return addRule((value) => value == expected ? null : message) as BooleanValidator;
  }

  /// Ensures the value is not null.
  BooleanValidator notNull({String message = "Value cannot be null"}) {
    return addRule((value) => value == null ? message : null) as BooleanValidator;
  }

  /// **Overrides `parseValue` to convert `String?` input into `bool?`.**
  @override
  bool? parseValue(String? value) {
    if (value == null) return null;
    final lowerValue = value.toLowerCase().trim();
    if (["true", "yes", "on", "1"].contains(lowerValue)) return true;
    if (["false", "no", "off", "0"].contains(lowerValue)) return false;
    return null; // Invalid boolean string
  }
}
