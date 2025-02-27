import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('ObjectValidator', () {
    late ObjectValidator validator;

    setUp(() {
      validator = V.object().shape({
        'name': StringValidator().minLength(3),
        'age': NumberValidator().required().min(18),
      });
    });

    group('Shape Validation', () {
      group('Valid Cases', () {
        test('Valid object passes validation', () {
          final result = validator.validate({'name': 'Alice', 'age': 25});
          expect(result, isNull);
        });

        test('Allows extra keys when configured', () {
          validator.allowExtraKeys();
          final result = validator.validate({'name': 'Alice', 'age': 25, 'extra': 'value'});
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Null object returns an error', () {
          final result = validator.validate(returnAllErrors: true, null);
          expect(result, contains('Object cannot be null'));
        });

        test('Empty object returns required errors', () {
          final result = validator.validate(returnAllErrors: true,{});
          expect(result, contains('name is required'));
          expect(result, contains('age is required'));
        });

        test('Incorrect field types return errors', () {
          final result = validator.validateStrict(returnAllErrors: true, {'name': 123, 'age': '22'});
          expect(result, contains('name: Must be a valid string'));
          expect(result, contains('age: Must be a valid number'));
        });
      });
    });

    group('Optional Fields', () {
      setUp(() {
        validator.optionalFields(['nickname']);
      });

      group('Valid Cases', () {
        test('Optional fields do not require a value', () {
          final result = validator.validate({'name': 'Alice', 'age': 25});
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Optional field with null required value returns error', () {
          final result = validator.validate({'name': 'Alice', 'age': null});
          expect(result, contains('age: Field is required'));
        });
      });
    });

    group('Exact Keys Validation', () {
      setUp(() {
        validator.exactKeys(['name', 'age']);
      });

      group('Valid Cases', () {
        test('Valid object with exact keys passes', () {
          final result = validator.validate({'name': 'Alice', 'age': 25});
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Extra keys return an error', () {
          final result = validator.validate({'name': 'Alice', 'age': 25, 'extra': 'value'});
          expect(result, contains('Unexpected keys found: extra'));
        });
      });
    });

    group('Deep Equality Validation', () {
      setUp(() {
        validator.deepEqual({'name': 'Alice', 'age': 25});
      });

      group('Valid Cases', () {
        test('Deep equality check passes', () {
          final result = validator.validate({'name': 'Alice', 'age': 25});
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Different object structure fails', () {
          final result = validator.validate({'name': 'Alice', 'age': 30});
          expect(result, contains('Objects do not match'));
        });
      });
    });

    group('Custom Validation', () {
      setUp(() {
        validator.customValidation((value) {
          if (value['age'] > 100) return 'Age is unrealistic';
          return null;
        });
      });

      group('Valid Cases', () {
        test('Custom validation allows correct values', () {
          final result = validator.validate({'name': 'Alice', 'age': 50});
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Custom validation rejects incorrect values', () {
          final result = validator.validate({'name': 'Alice', 'age': 101});
          expect(result, contains('Age is unrealistic'));
        });
      });
    });

    group('Nested Object Validation', () {
      setUp(() {
        validator.shape({
          'address': V.object().shape({
            'street': StringValidator().minLength(3),
            'zip': NumberValidator().min(10000),
          })
        });
      });

      group('Valid Cases', () {
        test('Handles nested object validation correctly', () {
          final result = validator.validate({
            'name': 'Alice',
            'age': 25,
            'address': {'street': 'Elm Street', 'zip': 12345}
          });
          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Handles deeply nested structures with errors', () {
          final result = validator.validate(returnAllErrors: true,{
            'name': 'Alice',
            'age': 25,
            'address': {
              'street': 'A',
              'zip': 9999
            }
          });

          expect(result, contains('address: street: Must be at least 3 characters'));
          expect(result, contains('address: zip: Must be at least 10000'));
        });
      });
    });

    group('List Validation', () {
      setUp(() {
        validator.shape({
          'tags': ListValidator().minLength(2).maxLength(5),
        });
      });

      group('Valid Cases', () {
        test('Handles valid list inside object', () {
          final result = validator.validate({
            'name': 'Alice',
            'age': 25,
            'tags': ['flutter', 'dart']
          });

          expect(result, isNull);
        });
      });

      group('Invalid Cases', () {
        test('Handles invalid list inside object', () {
          final result = validator.validate({
            'name': 'Alice',
            'age': 25,
            'tags': ['flutter']
          });

          expect(result, contains('tags: Must have at least 2 items'));
        });
      });
    });
  });
}
