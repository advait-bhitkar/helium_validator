/// An abstract class for validating values of type `T`.
///
/// This class allows defining and applying validation rules to values of type `T`.
/// It provides methods for adding rules, validating values, and formatting validation errors.
abstract class Validator<T> {
  final List<String? Function(T?)> _rules = [];
  final String invalidTypeMessage;

  /// Creates a validator with a specified message for invalid type errors.
  Validator({required this.invalidTypeMessage});

  /// Returns an immutable list of validation rules.
  List<String? Function(T?)> get rules => List.unmodifiable(_rules);

  /// Adds a validation rule to the validator.
  ///
  /// The rule should be a function that takes a value of type `T?` and returns a
  /// validation error message as a `String?`, or `null` if the value is valid.
  ///
  /// Returns the current validator instance to allow method chaining.
  Validator<T> addRule(String? Function(T?) rule) {
    _rules.add(rule);
    return this;
  }

  /// Validates a given value by parsing it into type `T?`, then applying validation rules.
  ///
  /// - If the value cannot be parsed into `T?`, returns `invalidTypeMessage`.
  /// - If no validation errors occur, returns `null`.
  /// - If validation errors occur:
  ///   - Returns a single error message if `returnAllErrors` is `false`.
  ///   - Returns a list of all error messages if `returnAllErrors` is `true`.
  ///
  /// The value can be of any type and will be converted to `T?` before validation.
  Object? validate(dynamic value, {bool returnAllErrors = false, bool returnAsList = false}) {
    final parsedValue = _parseValue(value);
    final errors = _rules.map((rule) => rule(parsedValue)).whereType<String>().toList();

    if (returnAsList) return errors.isEmpty ? null : errors; // Always return a list if requested
    return _formatErrors(errors, returnAllErrors);
  }

  /// Validates a value of type `T?` directly, skipping parsing.
  ///
  /// - If the value is `null`, returns `invalidTypeMessage`.
  /// - Otherwise, applies validation rules and returns the result.
  Object? validateStrict(T? value, {bool returnAllErrors = false, bool returnAsList = false}) {
    return value == null ? invalidTypeMessage : validate(value, returnAllErrors: returnAllErrors);
  }

  /// Converts a `String?` input into a value of type `T?`.
  ///
  /// This method should be implemented by subclasses to define how values should be parsed.
  T? parseValue(String? input);

  /// Builds a function that validates a `String?` input.
  ///
  /// - Parses the input into `T?`.
  /// - Applies validation rules.
  /// - Returns a formatted error message if validation fails, or `null` if valid.
  ///
  /// Useful for integrating validation into form fields.
  String? Function(String?) build({bool returnAllErrors = false}) {
    return (String? value) => _formatErrors(
      validate(value, returnAllErrors: returnAllErrors),
      returnAllErrors,
    );
  }

  /// Attempts to parse a given value into type `T?`, handling NaN cases explicitly.
  ///
  /// - If `value` is already of type `T`, it is returned as is.
  /// - Otherwise, `value` is converted to a string and parsed using `parseValue()`.
  /// - If `parseValue()` returns `NaN` for a numeric type, `null` is returned.
  T? _parseValue(dynamic value) {
    if (value is T) return value;
    final parsed = parseValue(value?.toString());
    return (parsed is num && parsed.isNaN) ? null : parsed;
  }

  /// Formats validation errors into a readable string.
  ///
  /// - If there is a single error message, it is returned as a `String`.
  /// - If `returnAllErrors` is `true`, multiple errors are joined into a single string.
  /// - If there are no errors, returns `null`.
  String? _formatErrors(Object? errors, bool returnAllErrors) {
    if (errors is String) return errors;
    if (errors is List<String> && errors.isNotEmpty) {
      return returnAllErrors ? errors.join(", ") : errors.first;
    }
    return null;
  }
}
