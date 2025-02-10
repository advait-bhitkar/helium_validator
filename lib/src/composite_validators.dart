import 'validator.dart';

/// A validator that combines multiple validators into one.
///
/// This allows applying multiple validation rules from different validators
/// to a single value of type [T].
class CompositeValidator<T> extends Validator<T> {
  /// Creates a composite validator by merging validation rules from multiple [validators].
  CompositeValidator(List<Validator<T>> validators) {
    for (var validator in validators) {
      for (var rule in validator.rules) {
        addRule(rule);
      }
    }
  }
}
