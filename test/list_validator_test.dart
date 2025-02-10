import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('ListValidator', () {
    late ListValidator<int> intListValidator;
    late ListValidator<String> stringListValidator;

    setUp(() {
      intListValidator = ListValidator<int>();
      stringListValidator = ListValidator<String>();
    });

    test('minLength() should fail if list has fewer elements', () {
      final validator = intListValidator.minLength(3);
      expect(validator.validate([1, 2]), "Must have at least 3 items");
    });

    test('minLength() should pass if list has enough elements', () {
      final validator = intListValidator.minLength(2);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('maxLength() should fail if list has more elements', () {
      final validator = intListValidator.maxLength(3);
      expect(validator.validate([1, 2, 3, 4]), "Must have at most 3 items");
    });

    test('maxLength() should pass if list has fewer elements', () {
      final validator = intListValidator.maxLength(4);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('length() should fail if list does not match exact length', () {
      final validator = intListValidator.length(3);
      expect(validator.validate([1, 2]), "Must have exactly 3 items");
    });

    test('length() should pass if list matches exact length', () {
      final validator = intListValidator.length(3);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('unique() should fail if list contains duplicates', () {
      final validator = intListValidator.unique();
      expect(validator.validate([1, 2, 2, 3]), "All elements must be unique");
    });

    test('unique() should pass if all elements are unique', () {
      final validator = intListValidator.unique();
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('contains() should fail if item is missing', () {
      final validator = intListValidator.contains(5);
      expect(validator.validate([1, 2, 3]), "Must contain 5");
    });

    test('contains() should pass if item is present', () {
      final validator = intListValidator.contains(2);
      expect(validator.validate([1, 2, 3]), isNull);
    });
  });
}
