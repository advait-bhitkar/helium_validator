import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../helium_flutter_validator.dart';
import '../validator.dart';

/// A validator for validating object structures (Map<String, dynamic>).
/// Supports defining a schema, optional fields, extra key handling, and custom validation rules.
class ObjectValidator extends Validator<Map<String, dynamic>> {
  /// Creates an instance of [ObjectValidator].
  ///
  /// [invalidTypeMessage] defines the error message when the input is not a valid object.
  ObjectValidator({super.invalidTypeMessage = "Must be a valid object"});

  final Map<String, Validator> _schema = {};
  final Set<String> _optionalFields = {};
  bool _allowExtraKeys = false;

  /// Defines the structure of the expected object.
  ///
  /// Throws an [ArgumentError] if duplicate keys are added.
  ObjectValidator shape(Map<String, Validator> schema) {
    for (var key in schema.keys) {
      if (_schema.containsKey(key)) {
        throw ArgumentError("Key '$key' is already defined in the schema");
      }
    }
    _schema.addAll(schema);
    return this;
  }

  /// Specifies which fields are optional in the object.
  ObjectValidator optionalFields(List<String> fields) {
    _optionalFields.addAll(fields);
    return this;
  }

  /// Ensures that only the specified [keys] are allowed in the object.
  /// Returns an error message if extra keys are present.
  ObjectValidator exactKeys(List<String> keys, {String message = "Unexpected keys found"}) {
    _allowExtraKeys = false;
    return addRule((value) {
      if (value == null) return "Object cannot be null";
      final extraKeys = value.keys.toSet().difference(keys.toSet());
      return extraKeys.isNotEmpty ? "$message: ${extraKeys.join(', ')}" : null;
    }) as ObjectValidator;
  }

  /// Allows the object to have extra keys beyond the defined schema.
  ObjectValidator allowExtraKeys() {
    _allowExtraKeys = true;
    return this;
  }

  /// Ensures the object is not empty.
  ObjectValidator nonEmpty({String message = "Object cannot be empty"}) {
    return addRule((value) => (value == null || value.isEmpty) ? message : null) as ObjectValidator;
  }

  /// Adds a custom validation rule that checks the entire object.
  ObjectValidator customValidation(String? Function(Map<String, dynamic>) validator) {
    return addRule((value) => value == null ? "Value cannot be null" : validator(value)) as ObjectValidator;
  }

  /// Ensures the object matches the given [other] object exactly.
  ObjectValidator deepEqual(Map<String, dynamic> other, {String message = "Objects do not match"}) {
    return addRule((value) => value != null && mapEquals(value, other) ? null : message) as ObjectValidator;
  }

  /// Validates the given [value] against the defined schema and rules.
  ///
  /// - If [returnAllErrors] is `true`, returns a list of all validation errors.
  /// - If [returnAsList] is `true`, returns errors as a list instead of a single string.
  @override
  Object? validate(dynamic value, {bool returnAllErrors = false, bool returnAsList = false}) {
    if (value == null) return "Object cannot be null";

    if (value is! Map) {
      return "Invalid object format";
    }

    // Convert dynamically keyed maps to Map<String, dynamic>
    Map<String, dynamic> objectValue = _convertToStringKeyedMap(value);

    List<String> errors = [];

    // Validate missing required fields
    for (var key in _schema.keys) {
      if (!_optionalFields.contains(key) && !objectValue.containsKey(key)) {
        errors.add("$key is required");
      }
    }

    // Validate extra keys
    _validateKeys(objectValue, errors);

    // Validate each field based on schema
    _validateSchema(objectValue, errors, returnAllErrors, returnAsList);

    // Run custom validation rules
    for (var rule in rules) {
      final error = rule(objectValue);
      if (error != null) {
        if (!returnAllErrors) return error;
        errors.add(error);
      }
    }

    return returnAllErrors ? errors : (errors.isNotEmpty ? errors.first : null);
  }

  /// Ensures no unexpected keys are present if `_allowExtraKeys` is false.
  void _validateKeys(Map<String, dynamic> value, List<String> errors) {
    if (!_allowExtraKeys) {
      final extraKeys = value.keys.toSet().difference(_schema.keys.toSet());
      if (extraKeys.isNotEmpty) {
        errors.add("Unexpected keys: ${extraKeys.join(', ')}");
      }
    }
  }

  /// Validates each field in the object based on the schema.
  void _validateSchema(Map<String, dynamic> value, List<String> errors, bool returnAllErrors, bool returnAsList) {
    for (var key in _schema.keys) {
      if (!_optionalFields.contains(key) && !value.containsKey(key)) {
        errors.add("$key is required");
        continue;
      }

      final validator = _schema[key];
      if (validator == null) continue;

      final fieldErrors = validator.validate(value[key], returnAllErrors: returnAllErrors, returnAsList: returnAsList);

      if (fieldErrors is String) {
        errors.add("$key: $fieldErrors");
      } else if (fieldErrors is List<String>) {
        errors.addAll(fieldErrors.map((e) => "$key: $e"));
      }
    }
  }

  /// Validates the object strictly, including type checks for each field.
  void _validateSchemaStrict(Map<String, dynamic> value, List<String> errors, bool returnAllErrors, bool returnAsList) {
    for (var key in _schema.keys) {
      // Check for missing required fields
      if (!_optionalFields.contains(key) && !value.containsKey(key)) {
        errors.add("$key: is required");
        continue;
      }

      final validator = _schema[key];
      if (validator == null) continue;

      final fieldValue = value[key];

      // Handle type mismatch gracefully
      final expectedType = validator.runtimeType;  // Getting the expected validator type

      if (fieldValue != null && expectedType != null && fieldValue.runtimeType != expectedType) {
        // Here, you can customize the message based on your expected types
        String typeErrorMessage = "$key: Must be a valid ${_getExpectedTypeMessage(expectedType)}";
        errors.add(typeErrorMessage);
        continue; // Skip this field if type mismatch occurs
      }

      // Validate the field using the validator
      final fieldErrors = validator.validateStrict(fieldValue, returnAllErrors: returnAllErrors, returnAsList: returnAsList);

      // Collect field errors
      if (fieldErrors is String) {
        errors.add("$key: $fieldErrors");
      } else if (fieldErrors is List<String>) {
        errors.addAll(fieldErrors.map((e) => "$key: $e"));
      }
    }
  }

  // Helper method to map validator types to meaningful messages
  String _getExpectedTypeMessage(Type expectedType) {
    if (expectedType == StringValidator) {
      return "string";
    } else if (expectedType == NumberValidator) {
      return "number";
    } else {
      return "valid type";
    }
  }

  /// Recursively converts `Map<dynamic, dynamic>` to `Map<String, dynamic>`.
  Map<String, dynamic> _convertToStringKeyedMap(Map<dynamic, dynamic> map) {
    return map.map((key, value) {
      final newKey = key.toString();
      if (value is Map) {
        return MapEntry(newKey, _convertToStringKeyedMap(value));
      }
      return MapEntry(newKey, value);
    });
  }

  /// Parses a JSON string into a [Map<String, dynamic>].
  /// Returns `null` if parsing fails.
  @override
  Map<String, dynamic>? parseValue(String? input) {
    try {
      return input != null ? jsonDecode(input) as Map<String, dynamic> : null;
    } catch (e) {
      return null;
    }
  }

  /// Validates the object strictly, including type checks for each field.
  @override
  Object? validateStrict(Map<String, dynamic>? value, {bool returnAllErrors = false, bool returnAsList = false}) {
    if (value == null) return invalidTypeMessage;

    if (value is! Map<String, dynamic>) {
      return "Invalid object format";
    }

    List<String> errors = [];

    // Check for missing required fields
    for (var key in _schema.keys) {
      if (!_optionalFields.contains(key) && !value.containsKey(key)) {
        errors.add("$key is required");
      }
    }

    // Validate unexpected keys
    if (!_allowExtraKeys) {
      final extraKeys = value.keys.toSet().difference(_schema.keys.toSet());
      if (extraKeys.isNotEmpty) {
        errors.add("Unexpected keys found: ${extraKeys.join(', ')}");
      }
    }

    // Validate fields against their respective validators
    _validateSchemaStrict(value, errors, returnAllErrors, returnAsList);

    return returnAllErrors ? errors : (errors.isNotEmpty ? errors.first : null);
  }
}
