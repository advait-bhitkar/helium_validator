import 'validator.dart';

/// A validator that allows custom validation logic.
///
/// Enables defining validation rules dynamically using a custom function.
class CustomValidator<T> extends Validator<T> {
  /// Custom parsing logic (optional)
  final T? Function(String?)? _customParser;

  /// Constructor with optional custom parser
  CustomValidator({T? Function(String?)? customParser, super.invalidTypeMessage  = "Must be a valid type"}) : _customParser = customParser;

  /// Adds a custom validation rule.
  ///
  /// The [rule] function takes an input value of type [T] and returns
  /// an error message if validation fails, or `null` if validation passes.
  @override
  CustomValidator<T> addRule(String? Function(T? value) rule) {
    super.addRule(rule);
    return this;
  }

  /// Parses a string input into type `T`
  @override
  T? parseValue(String? input) {
    if (input == null) return null;

    if (_customParser != null) {
      return _customParser(input);
    }

    if (T == String) {
      return input as T;
    } else if (T == int) {
      final parsed = int.tryParse(input);
      return parsed as T?;
    } else if (T == double) {
      final parsed = double.tryParse(input);
      return parsed as T?;
    } else if (T == num) {
      final parsed = num.tryParse(input);
      return parsed as T?;
    } else if (T == bool) {
      final parsed = _parseBoolean(input);
      return parsed as T?;
    }

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
