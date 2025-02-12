import 'validator.dart';

/// A validator that combines multiple validators into one.
///
/// This allows applying multiple validation rules from different validators
/// to a single value of type [T].
class CompositeValidator<T> extends Validator<T> {
  final List<Validator<T>> validators;

  /// Creates a composite validator by merging validation rules from multiple [validators].
  CompositeValidator(this.validators) {
    for (var validator in validators) {
      for (var rule in validator.rules) {
        addRule(rule);
      }
    }
  }

  @override
  T? parseValue(String? input) {
    // Try to use `parseValue` from the first validator that implements it
    for (var validator in validators) {
      try {
        final parsed = validator.parseValue(input);
        if (parsed != null) return parsed;
      } catch (_) {
        // Ignore errors and continue
      }
    }
    return null; // No valid parsing found
  }
}
