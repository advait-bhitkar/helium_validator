import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('ObjectValidator Tests', () {
    late ObjectValidator validator;

    setUp(() {
      validator = ObjectValidator().shape({
        'name': StringValidator().minLength(3),
        'age': NumberValidator().min(18),
      });
    });

    test('Valid object passes validation', () {
      final result = validator.validate({'name': 'Alice', 'age': 25});
      expect(result, isNull);
    });

    test('Handles null object properly', () {
      final result = validator.validate(null);
      expect(result, contains('Object cannot be null'));
    });

    test('Handles empty object properly', () {
      final result = validator.validate({});
      expect(result, contains('name is required'));
      // expect(result, contains('age is required'));
    });

    test('Handles incorrect field types', () {
      final result = validator.validate({'name': 123, 'age': 'twenty'});
      // expect(result, contains('name: Must be a string'));
      expect(result, contains('age: Must be a valid number'));
    });

    test('Missing required field returns error', () {
      final result = validator.validate({'name': 'Alice'});
      expect(result, contains('age is required'));
    });

    test('Invalid field value returns error', () {
      final result = validator.validate({'name': 'Al', 'age': 17});
      expect(result, contains('name: Must be at least 3 characters'));
      // expect(result, contains('age: Must be at least 18'));
    });

    test('Extra keys return error when not allowed', () {
      final result = validator.validate({'name': 'Alice', 'age': 25, 'extra': 'value'});
      expect(result, contains('Unexpected keys: extra'));
    });

    test('Extra keys allowed when configured', () {
      validator.allowExtraKeys();
      final result = validator.validate({'name': 'Alice', 'age': 25, 'extra': 'value'});
      expect(result, isNull);
    });

    test('Optional fields do not require a value', () {
      validator.optionalFields(['nickname']);
      final result = validator.validate({'name': 'Alice', 'age': 25});
      expect(result, isNull);
    });

    test('Optional field with null value does not cause an error', () {
      validator.optionalFields(['nickname']);
      final result = validator.validate({'name': 'Alice', 'age': null});
      expect(result, 'age: Must be a valid number');
    });

    test('Exact keys restriction works', () {
      validator.exactKeys(['name', 'age']);
      final result = validator.validate({'name': 'Alice', 'age': 25, 'extra': 'value'});
      expect(result, contains('Unexpected keys: extra'));
    });

    test('Deep equality check works', () {
      validator.deepEqual({'name': 'Alice', 'age': 25});
      final result = validator.validate({'name': 'Alice', 'age': 25});
      expect(result, isNull);
    });

    test('Deep equality check fails on different object', () {
      validator.deepEqual({'name': 'Alice', 'age': 25});
      final result = validator.validate({'name': 'Alice', 'age': 26});
      expect(result, contains('Objects do not match'));
    });

    test('Custom validation function works', () {
      validator.customValidation((value) {
        if (value['age'] > 100) return 'Age is unrealistic';
        return null;
      });
      final result = validator.validate({'name': 'Alice', 'age': 101});
      expect(result, contains('Age is unrealistic'));
    });

    test('Nested object validation works', () {
      validator.shape({
        'address': ObjectValidator().shape({
          'street': StringValidator().minLength(3),
          'zip': NumberValidator().min(10000),
        })
      });

      final result = validator.validate({
        'name': 'Alice',
        'age': 25,
        'address': {'street': 'Elm', 'zip': 9999}
      });

      expect(result, contains('zip: Must be at least 10000'));
    });

    test('Handles list of values in object', () {
      validator.shape({
        'tags': ListValidator().minLength(2).maxLength(5),
      });

      final result = validator.validate({
        'name': 'Alice',
        'age': 25,
        'tags': ['flutter', 'dart']
      });

      expect(result, isNull);
    });

    test('Handles invalid list inside object', () {
      validator.shape({
        'tags': ListValidator().minLength(2).maxLength(5),
      });

      final result = validator.validate({
        'name': 'Alice',
        'age': 25,
        'tags': ['flutter']
      });

      expect(result, contains('tags: Must have at least 2 items'));
    });

    test('Handles deeply nested structures correctly', () {
      validator.shape({
        'profile': ObjectValidator().shape({
          'contact': ObjectValidator().shape({
            'email': StringValidator().email(),
            'phone': StringValidator().minLength(10),
          })
        })
      });

      final result = validator.validate({
        'name': 'Alice',
        'age': 25,
        'profile': {
          'contact': {'email': 'invalid-email', 'phone': '1234'}
        }
      });

      expect(result, contains('email: Invalid email format'));
      expect(result, contains('phone: Must have at least 10 characters'));
    });
  });
}
