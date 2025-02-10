abstract class Validator<T> {
  final List<String? Function(T?)> _rules = [];

  List<String? Function(T?)> get rules => _rules;

  Validator<T> addRule(String? Function(T?) rule) {
    _rules.add(rule);
    return this;
  }

  Validator<T> combineWith(Validator<T> other) {
    _rules.addAll(other._rules);
    return this;
  }

  /// Validates a given [value] against all added rules.
  ///
  /// If [returnAllErrors] is `true`, it returns a list of all error messages.
  /// If `false`, it returns only the first encountered error message.
  /// If there are no errors, returns `null` (for single error mode) or an empty list (for multiple error mode).
  dynamic validate(T? value, {bool returnAllErrors = false}) {
    List<String> errors = [];

    for (var rule in _rules) {
      final result = rule(value);
      if (result != null) {
        if (!returnAllErrors) return result; // Return first validation failure
        errors.add(result);
      }
    }

    return returnAllErrors ? errors : null;
  }

  /// Converts the validator into a Flutter-compatible validator function.
  ///
  /// By default, this will return only the first encountered error.
  String? Function(T?) build() {
    return (T? value) => validate(value, returnAllErrors: false) as String?;
  }

  /// Converts the validator into a function that returns **all** errors as a list.
  String? Function(T?) buildListValidator() {
    return (T? value) => validate(value, returnAllErrors: true) as String?;
  }
}
