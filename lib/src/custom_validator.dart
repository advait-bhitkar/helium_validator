import 'validator.dart';

/// A validator that allows custom validation logic.
///
/// This enables defining validation rules dynamically using a custom function.
class CustomValidator<T> extends Validator<T> {
  /// Adds a custom validation rule.
  ///
  /// The [rule] function takes an input value of type [T] and returns
  /// an error message if validation fails, or `null` if validation passes.
  CustomValidator<T> addRule(String? Function(T? value) rule) {
    super.addRule(rule);
    return this;
  }

  @override
  T? parseValue(String? input) {
    if (input == null) return null;

    if (T == String) return input as T;
    if (T == num) return num.tryParse(input) as T?;
    if (T == bool) return _parseBoolean(input) as T?;

    return null; // Unsupported type
  }

  /// Helper method to parse a string into a boolean value.
  bool? _parseBoolean(String value) {
    final lowerValue = value.toLowerCase().trim();
    if (["true", "yes", "on", "1"].contains(lowerValue)) return true;
    if (["false", "no", "off", "0"].contains(lowerValue)) return false;
    return null; // Invalid boolean string
  }
}
