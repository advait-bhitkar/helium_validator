import 'validator.dart';

/// A validator that allows custom validation logic.
///
/// This enables defining validation rules dynamically using a custom function.
class CustomValidator<T> extends Validator<T> {
  /// Adds a custom validation rule.
  ///
  /// The [rule] function takes an input value of type [T] and returns
  /// an error message if validation fails, or `null` if validation passes.
  CustomValidator<T> custom(String? Function(T? value) rule) {
    return addRule(rule) as CustomValidator<T>;
  }
}
