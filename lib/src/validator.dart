abstract class Validator<T> {
  final List<String? Function(T?)> _rules = [];

  /// Returns an immutable list of validation rules.
  List<String? Function(T?)> get rules => List.unmodifiable(_rules);

  /// Adds a validation rule and returns the updated validator.
  Validator<T> addRule(String? Function(T?) rule) {
    _rules.add(rule);
    return this;
  }

  /// Validates the given value and returns a list of errors.
  /// Returns an empty list if the value is valid.
  List<String> validate(T? value, {bool returnAllErrors = false}) {
    final List<String> errors = [];

    for (var rule in _rules) {
      final result = rule(value);
      if (result != null) {
        if (!returnAllErrors) return [result]; // Return first error immediately
        errors.add(result);
      }
    }

    return errors; // Always return a list (never null)
  }

  /// Converts a `String?` input to the required type `T?`.
  /// Must be implemented by subclasses.
  T? parseValue(String? input);

  /// Builds a function that validates a `String?` input by parsing it into `T?`.
  /// Allows customization of error handling.
  String? Function(String?) build({
    bool returnAllErrors = false,
    String invalidInputMessage = "Invalid input format",
  }) {
    return (String? value) {
      final T? parsedValue = parseValue(value);

      // Handle invalid parsing cases
      if (parsedValue == null && value != null) {
        return invalidInputMessage;
      }

      // Validate the parsed value
      final errors = validate(parsedValue, returnAllErrors: returnAllErrors);
      if (errors.isEmpty) return null;

      return returnAllErrors ? errors.join(", ") : errors.first;
    };
  }
}
