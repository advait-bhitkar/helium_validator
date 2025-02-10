import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('BooleanValidator Tests', () {
    test('isTrue should pass for "true" values', () {
      final validator = V.boolean().isTrue();
      expect(validator.validate("true"), isNull);
      expect(validator.validate("yes"), isNull);
      expect(validator.validate("on"), isNull);
      expect(validator.validate("1"), isNull);
    });

    test('isTrue should fail for non-true values', () {
      final validator = V.boolean().isTrue();
      expect(validator.validate("false"), equals("Must be true"));
      expect(validator.validate("no"), equals("Must be true"));
      expect(validator.validate("off"), equals("Must be true"));
      expect(validator.validate("0"), equals("Must be true"));
    });

    test('isFalse should pass for "false" values', () {
      final validator = V.boolean().isFalse();
      expect(validator.validate("false"), isNull);
      expect(validator.validate("no"), isNull);
      expect(validator.validate("off"), isNull);
      expect(validator.validate("0"), isNull);
    });

    test('isFalse should fail for non-false values', () {
      final validator = V.boolean().isFalse();
      expect(validator.validate("true"), equals("Must be false"));
      expect(validator.validate("yes"), equals("Must be false"));
      expect(validator.validate("on"), equals("Must be false"));
      expect(validator.validate("1"), equals("Must be false"));
    });

    test('matches should validate specific boolean values', () {
      final validatorTrue = V.boolean().matches(true);
      final validatorFalse = V.boolean().matches(false);

      expect(validatorTrue.validate("true"), isNull);
      expect(validatorTrue.validate("false"), equals("Must be true"));
      expect(validatorFalse.validate("false"), isNull);
      expect(validatorFalse.validate("true"), equals("Must be false"));
    });

    test('not should validate inverse boolean values', () {
      final validator = V.boolean().not(true);

      expect(validator.validate("true"), equals("Must not be true"));
      expect(validator.validate("false"), isNull);
    });

    test('xor should validate XOR logic', () {
      final validator = V.boolean().xor(true);

      expect(validator.validate("true"), equals("Must be XOR true"));
      expect(validator.validate("false"), isNull);
    });

    test('equals should check exact boolean equality', () {
      final validator = V.boolean().equals(true);

      expect(validator.validate("true"), isNull);
      expect(validator.validate("false"), equals("Must match expected value"));
    });

    test('notNull should fail on null values', () {
      final validator = V.boolean().notNull();
      expect(validator.validate(null), equals("Value cannot be null"));
    });
  });
}
