import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('ListValidator', () {
    late ListValidator<int> intListValidator;
    late ListValidator<String> stringListValidator;

    setUp(() {
      intListValidator = V.list<int>();
      stringListValidator = V.list<String>();
    });

    // minLength Tests
    test('minLength() should fail if list has fewer elements', () {
      final validator = intListValidator.minLength(3);
      expect(validator.validate([1, 2]), "Must have at least 3 items");
    });

    test('minLength() should pass if list has enough elements', () {
      final validator = intListValidator.minLength(2);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('minLength() should pass for an empty list when length is 0', () {
      final validator = intListValidator.minLength(0);
      expect(validator.validate([]), isNull);
    });

    // maxLength Tests
    test('maxLength() should fail if list has more elements', () {
      final validator = intListValidator.maxLength(3);
      expect(validator.validate([1, 2, 3, 4]), "Must have at most 3 items");
    });

    test('maxLength() should pass if list has fewer elements', () {
      final validator = intListValidator.maxLength(4);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('maxLength() should pass for an empty list', () {
      final validator = intListValidator.maxLength(5);
      expect(validator.validate([]), isNull);
    });

    // length Tests
    test('length() should fail if list does not match exact length', () {
      final validator = intListValidator.length(3);
      expect(validator.validate([1, 2]), "Must have exactly 3 items");
    });

    test('length() should pass if list matches exact length', () {
      final validator = intListValidator.length(3);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('length() should fail for an empty list when nonzero length is required', () {
      final validator = intListValidator.length(2);
      expect(validator.validate([]), "Must have exactly 2 items");
    });

    // unique Tests
    test('unique() should fail if list contains duplicates', () {
      final validator = intListValidator.unique();
      expect(validator.validate([1, 2, 2, 3]), "All elements must be unique");
    });

    test('unique() should pass if all elements are unique', () {
      final validator = intListValidator.unique();
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('unique() should pass for an empty list', () {
      final validator = intListValidator.unique();
      expect(validator.validate([]), isNull);
    });

    // contains Tests
    test('contains() should fail if item is missing', () {
      final validator = intListValidator.contains(5);
      expect(validator.validate([1, 2, 3]), "Must contain 5");
    });

    test('contains() should pass if item is present', () {
      final validator = intListValidator.contains(2);
      expect(validator.validate([1, 2, 3]), isNull);
    });

    test('contains() should fail for an empty list', () {
      final validator = intListValidator.contains(1);
      expect(validator.validate([]), "Must contain 1");
    });

    // parseValue Tests
    test('parseValue() should correctly parse a comma-separated string into a list', () {
      final result = stringListValidator.parseValue("apple, banana, cherry");
      expect(result, ["apple", "banana", "cherry"]);
    });

    test('parseValue() should return null for empty string', () {
      final result = stringListValidator.parseValue("");
      expect(result, []);
    });

    test('parseValue() should trim spaces around elements', () {
      final result = stringListValidator.parseValue(" apple , banana , cherry ");
      expect(result, ["apple", "banana", "cherry"]);
    });

    // Edge Cases
    test('Validator should handle null values gracefully', () {
      final validator = intListValidator.minLength(1);
      expect(validator.validate(null), "Must have at least 1 items");
    });

    test('Validator should handle lists of different types', () {
      final boolValidator = ListValidator<bool>().unique();
      expect(boolValidator.validate([true, false, true]), "All elements must be unique");
    });

    test('parseValue() should return an empty list for an empty string if allowed', () {
      final result = stringListValidator.parseValue("");
      expect(result, []);
    });

    test('contains() should work with strings', () {
      final validator = stringListValidator.contains("banana");
      expect(validator.validate(["apple", "banana", "cherry"]), isNull);
    });

    test('minLength() and maxLength() should work together', () {
      final validator = intListValidator.minLength(2).maxLength(4);
      expect(validator.validate([1, 2, 3]), isNull);
      expect(validator.validate([1]), "Must have at least 2 items");
      expect(validator.validate([1, 2, 3, 4, 5]), "Must have at most 4 items");
    });

    test('multiple rules should work together', () {
      final validator = intListValidator.minLength(2).maxLength(4).unique().contains(3);
      expect(validator.validate([1, 2, 3]), isNull);
      expect(validator.validate([1, 1, 2]), "All elements must be unique");
      expect(validator.validate([1]), "Must have at least 2 items");
      expect(validator.validate([1, 2, 3, 4, 5]), "Must have at most 4 items");
      expect(validator.validate([1, 2, 4]), "Must contain 3");
    });
  });
}
