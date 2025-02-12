import 'custom_validator.dart';
import 'validators/date_validator.dart';
import 'validators/list_validator.dart';
import 'validators/object_validator.dart';
import 'validators/string_validator.dart';
import 'validators/number_validators.dart';
import 'validators/boolean_validator.dart';

/// A utility class providing quick access to various validators.
///
/// This class serves as a shorthand factory for creating different types of validators, 
/// making validation logic more readable and concise.
class V {
  /// Returns a validator for string values.
  static StringValidator string() => StringValidator();

  /// Returns a validator for numeric values.
  static NumberValidator number() => NumberValidator();

  /// Returns a validator for boolean values.
  static BooleanValidator boolean() => BooleanValidator();

  /// Returns a validator for date values.
  static DateValidator date() => DateValidator();

  /// Returns a validator for list values.
  static ListValidator<T> list<T>() => ListValidator<T>();

  /// Returns a validator for object values (e.g., maps, complex structures).
  static ObjectValidator<T> object<T>() => ObjectValidator<T>();

  /// Returns a custom validator for defining custom validation rules.
  static CustomValidator custom() => CustomValidator();
}
