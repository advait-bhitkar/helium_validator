import 'package:flutter_test/flutter_test.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

void main() {
  group('StringValidator - required() with custom message', () {
    final defaultValidator = V.string().required();
    final customValidator = V.string().required(message: "This field cannot be empty");

    test('should return null when value is a non-empty string', () {
      expect(defaultValidator.validate('Hello'), isNull);
    });

    test('should return default error message when value is null', () {
      expect(defaultValidator.validate(null), "Field is required");
    });

    test('should return default error message when value is an empty string', () {
      expect(defaultValidator.validate(''), "Field is required");
    });

    /// ⚠️ Edge Cases
    test('should return default error message when value contains only whitespace', () {
      expect(defaultValidator.validate('   '), "Field is required");
    });

    test('should return null for a string with whitespace but containing characters', () {
      expect(defaultValidator.validate('  Hello  '), isNull);
    });

    /// 📝 **Custom Message Tests**
    test('should return custom error message when value is null', () {
      expect(customValidator.validate(null), "This field cannot be empty");
    });

    test('should return custom error message when value is an empty string', () {
      expect(customValidator.validate(''), "This field cannot be empty");
    });

    test('should return custom error message when value contains only whitespace', () {
      expect(customValidator.validate('   '), "This field cannot be empty");
    });

    /// 🔗 **Chained Validation**
    test('should work correctly when chaining required() and minLength()', () {
      final chainValidator = StringValidator().required().minLength(3);

      expect(chainValidator.validate(''), "Field is required");
      expect(chainValidator.validate('Hi'), "Must be at least 3 characters");
      expect(chainValidator.validate('Hello'), isNull);
    });
  });

  group('StringValidator Tests', () {
    test('required() - should return error when value is null or empty', () {
      final validator = V.string().required();
      expect(validator.validate(null), "Field is required");
      expect(validator.validate(""), "Field is required");
    });

    test('minLength() - should return error if length is less than required', () {
      final validator = V.string().minLength(5);
      expect(validator.validate("abc"), "Must be at least 5 characters");
      expect(validator.validate("hello"), null);
    });

    test('maxLength() - should return error if length exceeds limit', () {
      final validator = V.string().maxLength(5);
      expect(validator.validate("abcdef"), "Must be at most 5 characters");
      expect(validator.validate("hello"), null);
    });

    test('email() - should validate email format', () {
      final validator = V.string().email();
      expect(validator.validate("test@example.com"), null);
      expect(validator.validate("invalid-email"), "Invalid email");
    });

    test('url() - should validate URL format', () {
      final validator = V.string().url();
      expect(validator.validate("https://example.com"), null);
      expect(validator.validate("not_a_url"), "Invalid URL");
    });

    test('uuid() - should validate UUID format', () {
      final validator = V.string().uuid();
      expect(validator.validate("123e4567-e89b-12d3-a456-426614174000"), null);
      expect(validator.validate("invalid-uuid"), "Invalid UUID");
    });

    test('json() - should validate JSON strings', () {
      final validator = V.string().json();
      expect(validator.validate('{"name": "John"}'), null);
      expect(validator.validate("Invalid JSON"), "Invalid JSON");
    });

    test('alpha() - should allow only alphabetic characters', () {
      final validator = V.string().alpha();
      expect(validator.validate("Hello"), null);
      expect(validator.validate("Hello123"), "Must contain only letters");
    });

    test('alphanumeric() - should allow only letters and numbers', () {
      final validator = V.string().alphanumeric();
      expect(validator.validate("Hello123"), null);
      expect(validator.validate("Hello@123"), "Must contain only letters and numbers");
    });

    test('creditCard() - should validate credit card numbers', () {
      final validator = V.string().creditCard();
      expect(validator.validate("5105105105105100"), null);
      expect(validator.validate("4111 1111 1111 1111"), 'Invalid credit card');
      expect(validator.validate("1234 5678 9012 3456"), "Invalid credit card");
    });

    test('hexColor() - should validate HEX color codes', () {
      final validator = V.string().hexColor();
      expect(validator.validate("#ff5733"), null);
      expect(validator.validate("#xyz123"), "Invalid HEX color");
    });

    test('isPalindrome() - should validate palindromes', () {
      final validator = V.string().isPalindrome();
      expect(validator.validate("madam"), null);
      expect(validator.validate("hello"), "String is not a palindrome");
    });
  });

  group('StringValidator.length', () {
    final validator = StringValidator().length(5);

    test('Valid case: string with exact length', () {
      expect(validator.validate("Hello"), isNull);
    });

    test('Invalid case: string shorter than required length', () {
      expect(validator.validate("Hi"), "Must be exactly 5 characters");
    });

    test('Invalid case: string longer than required length', () {
      expect(validator.validate("HelloWorld"), "Must be exactly 5 characters");
    });

    test('Valid case: custom error message', () {
      final customValidator = StringValidator().length(4, message: "Wrong length");
      expect(customValidator.validate("Hey"), "Wrong length");
    });
  });

  group('StringValidator.contains', () {
    final validator = StringValidator().contains("test");

    test('Valid case: string contains the expected substring', () {
      expect(validator.validate("this is a test"), isNull);
    });

    test('Invalid case: string does not contain the expected substring', () {
      expect(validator.validate("this is a demo"), "Must contain 'test'");
    });

    test('Valid case: custom error message', () {
      final customValidator = StringValidator().contains("abc", message: "Substring missing");
      expect(customValidator.validate("hello world"), "Substring missing");
    });
  });

  group('StringValidator.startsWith', () {
    final validator = StringValidator().startsWith("Hello");

    test('Valid case: string starts with expected prefix', () {
      expect(validator.validate("Hello world"), isNull);
    });

    test('Invalid case: string does not start with expected prefix', () {
      expect(validator.validate("world Hello"), "Must start with 'Hello'");
    });

    // test('Invalid case null value', () {
    //   expect(validator.validate(null), "Must start with 'Hello'");
    // });

    test('Valid case custom error message', () {
      final customValidator = StringValidator().startsWith("Hi", message: "Wrong start");
      expect(customValidator.validate("Bye there"), "Wrong start");
    });
  });

  group('StringValidator.endsWith', () {
    final validator = StringValidator().endsWith("world");

    test('Valid case: string ends with expected suffix', () {
      expect(validator.validate("Hello world"), isNull);
    });

    test('Invalid case: string does not end with expected suffix', () {
      expect(validator.validate("world Hello"), "Must end with 'world'");
    });

    // test('Invalid case: null value', () {
    //   expect(validator.validate(null), "Must end with 'world'");
    // });

    test('Valid case custom error message', () {
      final customValidator = StringValidator().endsWith("done", message: "Wrong end");
      expect(customValidator.validate("Almost finished"), "Wrong end");
    });
  });

  group('StringValidator.datetime', () {
    final validator = StringValidator().datetime();

    test('Valid case: correct datetime format', () {
      expect(validator.validate("2023-08-15 14:30:45"), isNull);
    });

    test('Invalid case: missing seconds', () {
      expect(validator.validate("2023-08-15 14:30"), "Invalid datetime");
    });

    test('Invalid case: invalid date format', () {
      expect(validator.validate("15-08-2023 14:30:45"), "Invalid datetime");
    });

    // test('Invalid case: null value', () {
    //   expect(validator.validate(null), "Invalid datetime");
    // });

    test('Custom message case', () {
      final customValidator = StringValidator().datetime(message: "Wrong format");
      expect(customValidator.validate("2023-08-15"), "Wrong format");
    });
  });

  group('StringValidator.date', () {
    final validator = StringValidator().date();

    test('Valid case: correct date format', () {
      expect(validator.validate("2023-08-15"), isNull);
    });

    test('Invalid case: missing year', () {
      expect(validator.validate("08-15"), "Invalid date");
    });

    test('Invalid case: extra time included', () {
      expect(validator.validate("2023-08-15 12:00:00"), "Invalid date");
    });

    // test('Invalid case: null value', () {
    //   expect(validator.validate(null), "Invalid date");
    // });
  });

  group('StringValidator.time', () {
    final validator = StringValidator().time();

    test('Valid case: correct time format', () {
      expect(validator.validate("14:30:45"), isNull);
    });

    test('Invalid case: missing seconds', () {
      expect(validator.validate("14:30"), "Invalid time");
    });

    test('Invalid case: including date', () {
      expect(validator.validate("2023-08-15 14:30:45"), "Invalid time");
    });

    // test('Invalid case: null value', () {
    //   expect(validator.validate(null), "Invalid time");
    // });
  });

  group('StringValidator.ip', () {
    final validator = StringValidator().ip();

    test('Valid case: IPv4 address', () {
      expect(validator.validate("192.168.1.1"), isNull);
    });

    test('Valid case: IPv6 address', () {
      expect(validator.validate("2001:db8::ff00:42:8329"), isNull);
    });

    test('Invalid case: missing octet', () {
      expect(validator.validate("192.168.1"), "Invalid IP address");
    });

    test('Invalid case: extra dot', () {
      expect(validator.validate("192.168.1.1."), "Invalid IP address");
    });

    // test('Invalid case: null value', () {
    //   expect(validator.validate(null), "Invalid IP address");
    // });
  });

  group('StringValidator.cidr', () {
    final validator = StringValidator().cidr();

    test('Valid case: IPv4 CIDR', () {
      expect(validator.validate("192.168.1.1/24"), isNull);
    });

    test('Valid case: IPv6 CIDR', () {
      expect(validator.validate("2001:db8::/32"), isNull);
    });

    test('Invalid case: missing mask', () {
      expect(validator.validate("192.168.1.1"), "Invalid CIDR notation");
    });

    test('Invalid case: invalid prefix', () {
      expect(validator.validate("192.168.1.1/abc"), "Invalid CIDR notation");
    });
  });
}
