import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('DateValidator Tests', () {
    late DateValidator validator;

    setUp(() {
      validator = V.date();
    });

    test('Required validation', () {
      expect(validator.required().validate(''), "Date is required");
      expect(validator.required().validate(null), "Date is required");
      expect(validator.required().validate('2024-02-10'), null);
    });

    test('Before validation', () {
      final date = DateTime(2025, 1, 1);
      expect(validator.before(date).validate('2024-12-31'), null);
      expect(validator.before(date).validate('2025-01-02'), "Must be before 2025-01-01");
    });

    test('After validation', () {
      final date = DateTime(2023, 1, 1);
      expect(validator.after(date).validate('2023-01-02'), null);
      expect(validator.after(date).validate('2022-12-31'), "Must be after 2023-01-01");
    });

    test('Between validation', () {
      final start = DateTime(2023, 1, 1);
      final end = DateTime(2024, 1, 1);
      expect(validator.between(start, end).validate('2023-06-15'), null);
      expect(validator.between(start, end).validate('2025-01-01'), "Must be between 2023-01-01 and 2024-01-01");
    });

    test('Exact date validation', () {
      final target = DateTime(2023, 5, 20);
      expect(validator.exact(target).validate('2023-05-20'), null);
      expect(validator.exact(target).validate('2023-05-21'), "Must be exactly 2023-05-20");
    });

    test('Not exact date validation', () {
      final target = DateTime(2023, 5, 20);
      expect(validator.notExact(target).validate('2023-05-21'), null);
      expect(validator.notExact(target).validate('2023-05-20'), "Must not be exactly 2023-05-20");
    });

    test('Weekday only validation', () {
      expect(validator.weekdayOnly().validate('2024-02-09'), null); // Friday
      expect(validator.weekdayOnly().validate('2024-02-10'), "Must be a weekday (Monday to Friday)"); // Saturday
    });

    test('Weekend only validation', () {
      expect(validator.weekendOnly().validate('2024-02-10'), null); // Saturday
      expect(validator.weekendOnly().validate('2024-02-09'), "Must be a weekend (Saturday or Sunday)"); // Friday
    });

    test('Future date validation', () {
      final futureDate = DateTime.now().add(Duration(days: 1));
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      expect(validator.futureOnly().validate(futureDate.toString().split(' ')[0]), null);
      expect(validator.futureOnly().validate(pastDate.toString().split(' ')[0]), "Must be a future date");
    });

    test('Past date validation', () {
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      final futureDate = DateTime.now().add(Duration(days: 1));
      expect(validator.pastOnly().validate(pastDate.toString().split(' ')[0]), null);
      expect(validator.pastOnly().validate(futureDate.toString().split(' ')[0]), "Must be a past date");
    });
  });
}