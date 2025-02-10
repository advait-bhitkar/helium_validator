import 'dart:convert';
import '../validator.dart';

class ObjectValidator extends Validator<Map<String, dynamic>> {
  final Map<String, Validator> _schema = {};
  final Set<String> _optionalFields = {};
  bool _allowExtraKeys = false;

  /// Defines a structured object schema
  ObjectValidator shape(Map<String, Validator> schema) {
    _schema.addAll(schema);
    return this;
  }

  /// Makes specific fields optional
  ObjectValidator optionalFields(List<String> fields) {
    _optionalFields.addAll(fields);
    return this;
  }

  /// Ensures the object has only the expected keys
  ObjectValidator exactKeys(List<String> keys,
      {String message = "Unexpected keys found"}) {
    return addRule((value) {
      if (value == null) return "Object cannot be null";
      final extraKeys = value.keys.toSet().difference(keys.toSet());
      return extraKeys.isNotEmpty ? "$message: ${extraKeys.join(', ')}" : null;
    }) as ObjectValidator;
  }

  /// Allows extra keys beyond the defined schema
  ObjectValidator allowExtraKeys() {
    _allowExtraKeys = true;
    return this;
  }

  /// Ensures the object is not empty
  ObjectValidator nonEmpty({String message = "Object cannot be empty"}) {
    return addRule((value) {
      if (value == null || value.isEmpty) return message;
      return null;
    }) as ObjectValidator;
  }

  /// Custom validation logic for the entire object
  ObjectValidator customValidation(
      String? Function(Map<String, dynamic>) validator) {
    return addRule((value) => value == null ? "Value cannot be null" : validator(value)) as ObjectValidator;
  }

  /// Checks if an object deeply matches another object
  ObjectValidator deepEqual(Map<String, dynamic> other,
      {String message = "Objects do not match"}) {
    return addRule((value) =>
    value != null && _deepEqual(value, other) ? null : message) as ObjectValidator;
  }

  /// Validates the object against the schema
  @override
  dynamic? validate(Map<String, dynamic>? value, {bool returnAllErrors = false}) {
    if (value == null) return "Object cannot be null";
    if (value is! Map<String, dynamic>) return "Invalid object format";

    if (!_allowExtraKeys) {
      final extraKeys = value.keys.toSet().difference(_schema.keys.toSet());
      if (extraKeys.isNotEmpty) return "Unexpected keys: ${extraKeys.join(', ')}";
    }

    for (var key in _schema.keys) {
      if (!_optionalFields.contains(key) && !value.containsKey(key)) {
        return "$key is required";
      }
      final validator = _schema[key]!;
      final error = validator.validate(value[key].toString());
      if (error != null) return "$key: $error";
    }
    return null;
  }

  /// Deep equality check for nested objects
  bool _deepEqual(Map<String, dynamic>? a, Map<String, dynamic>? b) {
    if (a == null || b == null) return false;
    return jsonEncode(a) == jsonEncode(b);
  }
}
