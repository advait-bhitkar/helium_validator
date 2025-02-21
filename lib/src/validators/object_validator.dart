import 'dart:convert';
import 'package:flutter/foundation.dart'; // for mapEquals
import '../validator.dart';

class ObjectValidator<T> extends Validator<Map<String, dynamic>> {

  /// Creates a [ObjectValidator] with a custom error message for invalid types.
  ObjectValidator({super.invalidTypeMessage = "Must be a valid object"});

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
  ObjectValidator exactKeys(List<String> keys, {String message = "Unexpected keys found"}) {
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
  ObjectValidator customValidation(String? Function(Map<String, dynamic>) validator) {
    return addRule((value) => value == null ? "Value cannot be null" : validator(value)) as ObjectValidator;
  }

  /// Checks if an object deeply matches another object
  ObjectValidator deepEqual(Map<String, dynamic> other, {String message = "Objects do not match"}) {
    return addRule((value) => value != null && mapEquals(value, other) ? null : message) as ObjectValidator;
  }

  /// Validates the object against the schema
  @override
  Object? validate(dynamic value, {bool returnAllErrors = false, bool returnAsList = false}) {
    if (value == null) return "Object cannot be null";
    if (value is! Map<String, dynamic>) return "Invalid object format";

    List<String> errors = [];

    if (!_allowExtraKeys) {
      final extraKeys = value.keys.toSet().difference(_schema.keys.toSet());
      if (extraKeys.isNotEmpty) errors.add("Unexpected keys: ${extraKeys.join(', ')}");
    }

    for (var key in _schema.keys) {
      if (!_optionalFields.contains(key) && !value.containsKey(key)) {
        errors.add("$key is required");
      } else {
        final validator = _schema[key]!;
        final fieldErrors = validator.validate(value[key], returnAllErrors: returnAllErrors, returnAsList: returnAsList);

        if (fieldErrors is String) {
          // If it's a single error string, return immediately if returnAllErrors is false
          if (!returnAllErrors) return "$key: $fieldErrors";
          errors.add("$key: $fieldErrors");
        } else if (fieldErrors is List<String>) {
          errors.addAll(fieldErrors.map((e) => "$key: $e"));
        }
      }
    }

    return returnAllErrors ? errors : (errors.isNotEmpty ? errors.first : null);
  }

  @override
  Map<String, dynamic>? parseValue(String? input) {
    try {
      return input != null ? jsonDecode(input) as Map<String, dynamic> : null;
    } catch (e) {
      return null;
    }
  }
}
