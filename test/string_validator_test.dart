import 'package:flutter_test/flutter_test.dart';
import 'package:helium_validator/helium_validator.dart';

void main() {

  group('StringValidator - required()', () {
    final defaultValidator = V.string().required();
    final customValidator = V.string().required(message: "This field cannot be empty");
    final chainValidator = StringValidator().required().minLength(3);

    test('✅ Valid Cases', () {
      expect(defaultValidator.validate('Hello'), isNull);
      expect(defaultValidator.validate('  Hello  '), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(defaultValidator.validate(null), "Field is required");
      expect(defaultValidator.validate(''), "Field is required");
      expect(defaultValidator.validate('   '), "Field is required");

      expect(customValidator.validate(null), "This field cannot be empty");
      expect(customValidator.validate(''), "This field cannot be empty");
      expect(customValidator.validate('   '), "This field cannot be empty");

      expect(chainValidator.validate(''), "Field is required");
      expect(chainValidator.validate('Hi'), "Must be at least 3 characters");
    });
  });

  group('StringValidator - minLength()', () {
    final validator = StringValidator().minLength(3);
    final customValidator = StringValidator().minLength(3, message: "Too short!");

    test('✅ Valid Cases', () {
      expect(validator.validate('Hello'), isNull);
      expect(validator.validate('123'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate(''), "Must be at least 3 characters");
      expect(validator.validate('Hi'), "Must be at least 3 characters");

      expect(customValidator.validate(''), "Too short!");
      expect(customValidator.validate('Hi'), "Too short!");
    });
  });

  group('StringValidator - maxLength()', () {
    final validator = StringValidator().maxLength(5);
    final customValidator = StringValidator().maxLength(5, message: "Too long!");

    test('✅ Valid Cases', () {
      expect(validator.validate('Hi'), isNull);
      expect(validator.validate('12345'), isNull);
      expect(validator.validate(''), isNull); // Empty string is valid
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('123456'), "Must be at most 5 characters");
      expect(validator.validate('HelloWorld'), "Must be at most 5 characters");

      expect(customValidator.validate('123456'), "Too long!");
      expect(customValidator.validate('HelloWorld'), "Too long!");
    });
  });

  group('StringValidator - length()', () {
    final validator = StringValidator().length(5);
    final customValidator = StringValidator().length(5, message: "Must be 5 characters!");

    test('✅ Valid Cases', () {
      expect(validator.validate('12345'), isNull);
      expect(validator.validate('Hello'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate(''), "Must be exactly 5 characters");
      expect(validator.validate('1234'), "Must be exactly 5 characters");
      expect(validator.validate('123456'), "Must be exactly 5 characters");

      expect(customValidator.validate('1234'), "Must be 5 characters!");
      expect(customValidator.validate('123456'), "Must be 5 characters!");
    });
  });

  group('StringValidator - email()', () {
    final validator = StringValidator().email();
    final customValidator = StringValidator().email(message: "Please enter a valid email!");

    test('✅ Valid Cases', () {
      expect(validator.validate('test@example.com'), isNull);
      expect(validator.validate('user.name+tag@sub.domain.co.uk'), isNull);
      expect(validator.validate('valid123@mail.io'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate(''), "Invalid email");
      expect(validator.validate('plainaddress'), "Invalid email");
      expect(validator.validate('missing@domain'), "Invalid email");
      expect(validator.validate('missing@.com'), "Invalid email");
      expect(validator.validate('@missinguser.com'), "Invalid email");

      expect(customValidator.validate('plainaddress'), "Please enter a valid email!");
      expect(customValidator.validate('missing@domain'), "Please enter a valid email!");
    });
  });

  group('StringValidator - url()', () {
    final validator = StringValidator().url();
    final customValidator = StringValidator().url(message: "Please enter a valid URL!");

    test('✅ Valid Cases', () {
      expect(validator.validate('http://example.com'), isNull);
      expect(validator.validate('https://www.example.com'), isNull);
      expect(validator.validate('https://example.com'), isNull);
      expect(validator.validate('ftp://files.example.com'), isNull);
      expect(validator.validate('ftp://files.example.com'), isNull);
      expect(validator.validate('https://sub.domain.co.uk/path?query=1#fragment'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate(''), "Invalid URL");
      expect(validator.validate('example.com'), "Invalid URL");
      expect(validator.validate('www.example.com'), "Invalid URL");
      expect(validator.validate('http//invalid.com'), "Invalid URL");
      expect(validator.validate('https:/invalid.com'), "Invalid URL");

      expect(customValidator.validate('example.com'), "Please enter a valid URL!");
      expect(customValidator.validate('invalid url'), "Please enter a valid URL!");
    });
  });

  group('StringValidator - regex()', () {
    final digitValidator = StringValidator().regex(RegExp(r'^\d+$'), message: "Must be only digits");
    final alphaValidator = StringValidator().regex(RegExp(r'^[a-zA-Z]+$'), message: "Must be only letters");

    test('✅ Valid Cases', () {
      expect(digitValidator.validate('123456'), isNull);
      expect(alphaValidator.validate('Hello'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(digitValidator.validate('abc123'), "Must be only digits");
      expect(digitValidator.validate('123 456'), "Must be only digits");
      expect(digitValidator.validate(''), "Must be only digits");

      expect(alphaValidator.validate('Hello123'), "Must be only letters");
      expect(alphaValidator.validate('Hello!'), "Must be only letters");
      expect(alphaValidator.validate(''), "Must be only letters");
    });
  });

  group('StringValidator - contains()', () {
    final validator = StringValidator().contains("hello");
    final customValidator = StringValidator().contains("world", message: "Must include 'world'");

    test('✅ Valid Cases', () {
      expect(validator.validate('hello world'), isNull);
      expect(validator.validate('say hello!'), isNull);
      expect(customValidator.validate('hello world'), isNull);
      expect(customValidator.validate('the world is big'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('hi there'), "Must contain 'hello'");
      expect(validator.validate('HELLO WORLD'), "Must contain 'hello'");
      expect(validator.validate(''), "Must contain 'hello'");

      expect(customValidator.validate('hello everyone'), "Must include 'world'");
      expect(customValidator.validate(''), "Must include 'world'");
    });
  });

  group('StringValidator - startsWith()', () {
    final validator = StringValidator().startsWith("Hello");
    final customValidator = StringValidator().startsWith("World", message: "Must begin with 'World'");

    test('✅ Valid Cases', () {
      expect(validator.validate('Hello, how are you?'), isNull);
      expect(validator.validate('HelloWorld'), isNull);
      expect(customValidator.validate('World peace'), isNull);
      expect(customValidator.validate('World!'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('Hi, Hello!'), "Must start with 'Hello'");
      expect(validator.validate('hello world'), "Must start with 'Hello'"); // Case-sensitive
      expect(validator.validate(''), "Must start with 'Hello'");

      expect(customValidator.validate('hello World'), "Must begin with 'World'");
      expect(customValidator.validate('Peace in the world'), "Must begin with 'World'");
      expect(customValidator.validate(''), "Must begin with 'World'");
    });
  });

  group('StringValidator - endsWith()', () {
    final validator = StringValidator().endsWith("world");
    final customValidator = StringValidator().endsWith("Flutter", message: "Must conclude with 'Flutter'");

    test('✅ Valid Cases', () {
      expect(validator.validate('Hello world'), isNull);
      expect(validator.validate('This is a world'), isNull);
      expect(customValidator.validate('I love Flutter'), isNull);
      expect(customValidator.validate('Flutter'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('worldwide'), "Must end with 'world'");
      expect(validator.validate('WORLD'), "Must end with 'world'"); // Case-sensitive
      expect(validator.validate(''), "Must end with 'world'");

      expect(customValidator.validate('Flutter is great'), "Must conclude with 'Flutter'");
      expect(customValidator.validate(''), "Must conclude with 'Flutter'");
    });
  });

  group('StringValidator - uuid()', () {
    final validator = StringValidator().uuid();
    final customValidator = StringValidator().uuid(message: "Not a valid UUID");

    test('✅ Valid Cases', () {
      expect(validator.validate('550e8400-e29b-41d4-a716-446655440000'), isNull);
      expect(validator.validate('123e4567-e89b-12d3-a456-426614174000'), isNull);
      expect(customValidator.validate('f47ac10b-58cc-4372-a567-0e02b2c3d479'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('550e8400e29b41d4a716446655440000'), "Invalid UUID"); // Missing hyphens
      expect(validator.validate('12345678-1234-1234-1234-1234567890'), "Invalid UUID"); // Incorrect length
      expect(validator.validate('g47ac10b-58cc-4372-a567-0e02b2c3d479'), "Invalid UUID"); // Invalid character
      expect(validator.validate(''), "Invalid UUID"); // Empty string
      expect(customValidator.validate('not-a-uuid'), "Not a valid UUID"); // Custom error message test
    });
  });

  group('StringValidator - datetime()', () {
    final validator = StringValidator().datetime();
    final customValidator = StringValidator().datetime(message: "Not a valid datetime");

    test('✅ Valid Cases', () {
      expect(validator.validate('2024-02-25 14:30:45'), isNull);
      expect(validator.validate('1999-12-31 23:59:59'), isNull);
      expect(customValidator.validate('2023-01-01 00:00:00'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('2024-02-25'), "Invalid datetime"); // Missing time
      expect(validator.validate('14:30:45'), "Invalid datetime"); // Missing date
      expect(validator.validate('2024-02-25T14:30:45'), "Invalid datetime"); // Incorrect format (ISO8601)
      expect(validator.validate('2024-2-25 14:30:45'), "Invalid datetime"); // Single-digit month
      expect(validator.validate(''), "Invalid datetime"); // Empty string
      expect(customValidator.validate('invalid-date'), "Not a valid datetime"); // Custom error message test
    });
  });

  group('StringValidator - date()', () {
    final validator = StringValidator().date();
    final customValidator = StringValidator().date(message: "Not a valid date");

    test('✅ Valid Cases', () {
      expect(validator.validate('2024-02-25'), isNull);
      expect(validator.validate('1999-12-31'), isNull);
      expect(customValidator.validate('2023-01-01'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('2024-02-25 14:30:45'), "Invalid date"); // Contains time
      expect(validator.validate('02-25-2024'), "Invalid date"); // Wrong format (MM-DD-YYYY)
      expect(validator.validate('2024/02/25'), "Invalid date"); // Wrong separator
      expect(validator.validate('2024-2-25'), "Invalid date"); // Single-digit month
      expect(validator.validate(''), "Invalid date"); // Empty string
      expect(customValidator.validate('invalid-date'), "Not a valid date"); // Custom error message test
    });
  });

  group('StringValidator - time()', () {
    final validator = StringValidator().time();
    final customValidator = StringValidator().time(message: "Not a valid time");

    test('✅ Valid Cases', () {
      expect(validator.validate('14:30:45'), isNull);
      expect(validator.validate('00:00:00'), isNull);
      expect(validator.validate('23:59:59'), isNull);
      expect(customValidator.validate('12:34:56'), isNull);
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('14:30'), "Invalid time"); // Missing seconds
      expect(validator.validate('24:00:00'), "Invalid time"); // Invalid hour
      expect(validator.validate('12:60:00'), "Invalid time"); // Invalid minutes
      expect(validator.validate('12:30:60'), "Invalid time"); // Invalid seconds
      expect(validator.validate('12:3:45'), "Invalid time"); // Incorrect format
      expect(validator.validate('12-30-45'), "Invalid time"); // Wrong separator
      expect(validator.validate(''), "Invalid time"); // Empty string
      expect(customValidator.validate('invalid-time'), "Not a valid time"); // Custom error message test
    });
  });

  group('StringValidator - ip()', () {
    final validator = StringValidator().ip();
    final customValidator = StringValidator().ip(message: "Not a valid IP");

    test('✅ Valid Cases', () {
      expect(validator.validate('192.168.1.1'), isNull);
      expect(validator.validate('255.255.255.255'), isNull);
      expect(validator.validate('0.0.0.0'), isNull);
      expect(validator.validate('2001:db8::ff00:42:8329'), isNull); // IPv6 address
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('256.256.256.256'), "Invalid IP address"); // Out of range
      expect(validator.validate('192.168.1'), "Invalid IP address"); // Incomplete
      expect(validator.validate('192.168.1.1.1'), "Invalid IP address"); // Extra octet
      expect(validator.validate('192.168.1.abc'), "Invalid IP address"); // Non-numeric
      expect(validator.validate('1200::AB00:1234::2552:7777:1313'), "Invalid IP address"); // Invalid IPv6 format
      expect(validator.validate(''), "Invalid IP address"); // Empty string
      expect(customValidator.validate('invalid-ip'), "Not a valid IP"); // Custom error message test
    });
  });

  group('StringValidator - cidr()', () {
    final validator = StringValidator().cidr();
    final customValidator = StringValidator().cidr(message: "Not a valid CIDR");

    test('✅ Valid Cases', () {
      expect(validator.validate('192.168.1.0/24'), isNull); // Common IPv4 CIDR
      expect(validator.validate('10.0.0.0/8'), isNull); // Private network
      expect(validator.validate('172.16.0.0/16'), isNull);
      expect(validator.validate('0.0.0.0/0'), isNull); // Default route
      expect(validator.validate('255.255.255.255/32'), isNull); // Single host
      expect(validator.validate('2001:db8::/32'), isNull); // IPv6 CIDR
      expect(validator.validate('fe80::/10'), isNull); // Link-local IPv6
      expect(validator.validate('::/128'), isNull); // Single address
    });

    test('❌ Invalid Cases', () {
      expect(validator.validate('192.168.1.0'), "Invalid CIDR notation"); // Missing subnet mask
      expect(validator.validate('192.168.1.0/33'), "Invalid CIDR notation"); // Out of range for IPv4
      expect(validator.validate('256.256.256.256/24'), "Invalid CIDR notation"); // Invalid IP
      expect(validator.validate('2001:db8::/129'), "Invalid CIDR notation"); // Out of range for IPv6
      expect(validator.validate('fe80::'), "Invalid CIDR notation"); // Missing prefix length
      expect(validator.validate('/24'), "Invalid CIDR notation"); // Missing IP address
      expect(validator.validate('random-string'), "Invalid CIDR notation"); // Completely invalid
      expect(customValidator.validate('invalid-cidr'), "Not a valid CIDR"); // Custom error message
    });
  });

  group('StringValidator - json()', () {
    final validator = StringValidator().json();
    final customValidator = StringValidator().json(message: "Not a valid JSON");

    test('✅ Valid JSON Cases', () {
      expect(validator.validate('{"key": "value"}'), isNull); // Simple JSON
      expect(validator.validate('[1, 2, 3]'), isNull); // JSON Array
      expect(validator.validate('{"nested": {"key": 123}}'), isNull); // Nested JSON
      expect(validator.validate('{"bool": true, "null": null}'), isNull); // Boolean & Null
      expect(validator.validate('[]'), isNull); // Empty array
      expect(validator.validate('{}'), isNull); // Empty object
    });

    test('❌ Invalid JSON Cases', () {
      expect(validator.validate('{key: value}'), "Invalid JSON"); // Missing quotes
      expect(validator.validate('{"key": value}'), "Invalid JSON"); // Unquoted value
      expect(validator.validate('{123: "value"}'), "Invalid JSON"); // Number as key
      expect(validator.validate('random string'), "Invalid JSON"); // Not JSON
      expect(validator.validate('{"key": "value",}'), "Invalid JSON"); // Trailing comma
      expect(validator.validate(null), "Invalid JSON"); // Null input
      expect(customValidator.validate('invalid-json'), "Not a valid JSON"); // Custom message
    });
  });

  group('StringValidator - ascii()', () {
    final validator = StringValidator().ascii();
    final customValidator = StringValidator().ascii(message: "Only ASCII allowed");

    test('✅ Valid ASCII Cases', () {
      expect(validator.validate('HelloWorld123'), isNull); // Letters & numbers
      expect(validator.validate('!@#%^&*()_+-=[]{}|;:\'",.<>?/'), isNull); // Symbols
      expect(validator.validate(' '), isNull); // Space
      expect(validator.validate('The quick brown fox jumps over 13 lazy dogs!'), isNull); // Sentence
      expect(validator.validate(''), isNull); // Empty string
    });

    test('❌ Invalid ASCII Cases', () {
      expect(validator.validate('こんにちは'), "Must contain only ASCII characters"); // Japanese
      expect(validator.validate('你好'), "Must contain only ASCII characters"); // Chinese
      expect(validator.validate('Привет'), "Must contain only ASCII characters"); // Cyrillic
      expect(validator.validate('Héllo'), "Must contain only ASCII characters"); // Accented character (é)
      expect(validator.validate('Café'), "Must contain only ASCII characters"); // Accented character (é)
      expect(validator.validate('😀'), "Must contain only ASCII characters"); // Emoji
      expect(customValidator.validate('éñíô'), "Only ASCII allowed"); // Custom message
    });
  });

  group('StringValidator - alpha()', () {
    final validator = StringValidator().alpha();
    final customValidator = StringValidator().alpha(message: "Only letters allowed");

    test('✅ Valid Alphabetic Cases', () {
      expect(validator.validate('abc'), isNull); // Lowercase letters
      expect(validator.validate('ABC'), isNull); // Uppercase letters
      expect(validator.validate('HelloWorld'), isNull); // Mixed case
    });

    test('❌ Invalid Alphabetic Cases', () {
      expect(validator.validate('abc123'), "Must contain only letters"); // Contains numbers
      expect(validator.validate('hello world'), "Must contain only letters"); // Contains space
      expect(validator.validate('test!'), "Must contain only letters"); // Contains special character
      expect(validator.validate(''), "Must contain only letters"); // Empty string should fail
      expect(customValidator.validate('123'), "Only letters allowed"); // Custom error message
    });
  });

  group('StringValidator - alphanumeric()', () {
    final validator = StringValidator().alphanumeric();
    final customValidator = StringValidator().alphanumeric(message: "Only letters and numbers allowed");

    test('✅ Valid Alphanumeric Cases', () {
      expect(validator.validate('abc'), isNull); // Only letters
      expect(validator.validate('ABC'), isNull); // Uppercase letters
      expect(validator.validate('HelloWorld123'), isNull); // Mixed letters and numbers
      expect(validator.validate('123456'), isNull); // Only numbers
    });

    test('❌ Invalid Alphanumeric Cases', () {
      expect(validator.validate('hello world'), "Must contain only letters and numbers"); // Contains space
      expect(validator.validate('test!'), "Must contain only letters and numbers"); // Contains special character
      expect(validator.validate('abc_123'), "Must contain only letters and numbers"); // Contains underscore
      expect(validator.validate(''), "Must contain only letters and numbers"); // Empty string should fail
      expect(customValidator.validate('@test123'), "Only letters and numbers allowed"); // Custom error message
    });
  });

  group('StringValidator - isNumeric()', () {
    final validator = StringValidator().isNumeric();
    final customValidator = StringValidator().isNumeric(message: "Only numbers allowed");

    test('✅ Valid Numeric Cases', () {
      expect(validator.validate('123456'), isNull); // Only numbers
      expect(validator.validate('0'), isNull); // Single digit
      expect(validator.validate('9876543210'), isNull); // Long number
    });

    test('❌ Invalid Numeric Cases', () {
      expect(validator.validate('123 456'), "Must contain only numbers"); // Contains space
      expect(validator.validate('123abc'), "Must contain only numbers"); // Contains letters
      expect(validator.validate('12.34'), "Must contain only numbers"); // Contains a decimal point
      expect(validator.validate('+123'), "Must contain only numbers"); // Contains a plus sign
      expect(validator.validate('-123'), "Must contain only numbers"); // Contains a minus sign
      expect(validator.validate(''), "Must contain only numbers"); // Empty string should fail
      expect(customValidator.validate('123abc'), "Only numbers allowed"); // Custom error message
    });
  });

  group('StringValidator - slug()', () {
    final validator = StringValidator().slug();
    final customValidator = StringValidator().slug(message: "Not a valid slug");

    test('✅ Valid Slug Cases', () {
      expect(validator.validate('valid-slug'), isNull); // Simple slug
      expect(validator.validate('slug-123'), isNull); // Slug with numbers
      expect(validator.validate('a-b-c-d'), isNull); // Multiple hyphens
      expect(validator.validate('abc'), isNull); // Single word
      expect(validator.validate('abc123xyz'), isNull); // Alphanumeric
    });

    test('❌ Invalid Slug Cases', () {
      expect(validator.validate('Invalid-Slug'), "Invalid slug"); // Uppercase letters
      expect(validator.validate('slug_with_underscore'), "Invalid slug"); // Underscore not allowed
      expect(validator.validate('slug--with--double--hyphen'), "Invalid slug"); // Consecutive hyphens
      expect(validator.validate('-leading-hyphen'), "Invalid slug"); // Leading hyphen
      expect(validator.validate('trailing-hyphen-'), "Invalid slug"); // Trailing hyphen
      expect(validator.validate('slug with space'), "Invalid slug"); // Spaces not allowed
      expect(validator.validate('slug@special!char'), "Invalid slug"); // Special characters not allowed
      expect(validator.validate(''), "Invalid slug"); // Empty string should fail
      expect(customValidator.validate('invalid_slug'), "Not a valid slug"); // Custom error message
    });
  });

  group('StringValidator - creditCard()', () {
    final validator = StringValidator().creditCard();
    final customValidator = StringValidator().creditCard(message: "Not a valid credit card");

    test('✅ Valid Credit Card Cases', () {
      expect(validator.validate('4111111111111111'), isNull); // Visa
      expect(validator.validate('5500000000000004'), isNull); // MasterCard
      expect(validator.validate('340000000000009'), isNull); // American Express
      expect(validator.validate('30000000000004'), isNull); // Diners Club
      expect(validator.validate('6011000000000004'), isNull); // Discover
      expect(validator.validate('201400000000009'), isNull); // Diners Club enRoute
      expect(validator.validate('2131000000000008'), isNull); // JCB
      expect(validator.validate('180012345678901'), isNull); // JCB (older format)
    });

    test('❌ Invalid Credit Card Cases', () {
      expect(validator.validate('1234567812345678'), "Invalid credit card"); // Random digits
      expect(validator.validate('4111-1111-1111-1111'), "Invalid credit card"); // Hyphens not allowed
      expect(validator.validate('5500 0000 0000 0004'), "Invalid credit card"); // Spaces not allowed
      expect(validator.validate('5500000000000000000'), "Invalid credit card"); // Too long
      expect(validator.validate('abcd1234abcd5678'), "Invalid credit card"); // Non-numeric characters
      expect(validator.validate(''), "Invalid credit card"); // Empty string
      expect(customValidator.validate('invalid_card'), "Not a valid credit card"); // Custom error message
      expect(validator.validate('555555555555'), "Invalid credit card"); // Too short
    });
  });

  group('StringValidator - phoneNumber()', () {
    final validator = StringValidator().phoneNumber();
    final customValidator = StringValidator().phoneNumber(message: "Not a valid phone number");

    test('✅ Valid Phone Number Cases', () {
      expect(validator.validate('1234567'), isNull); // Minimum valid length
      expect(validator.validate('+123456789012345'), isNull); // Maximum valid length with country code
      expect(validator.validate('9876543210'), isNull); // Standard 10-digit number
      expect(validator.validate('+19876543210'), isNull); // International format with country code
      expect(validator.validate('00441234567890'), isNull); // International format without '+'
    });

    test('❌ Invalid Phone Number Cases', () {
      expect(validator.validate('12345'), "Invalid phone number"); // Too short
      expect(validator.validate('1234567890123456'), "Invalid phone number"); // Too long
      expect(validator.validate('+1-234-567-890'), "Invalid phone number"); // Hyphens not allowed
      expect(validator.validate('(123) 456-7890'), "Invalid phone number"); // Parentheses & spaces not allowed
      expect(validator.validate('phone1234567'), "Invalid phone number"); // Contains letters
      expect(validator.validate(''), "Invalid phone number"); // Empty string
      expect(customValidator.validate('invalid_number'), "Not a valid phone number"); // Custom error message
    });
  });

  group('StringValidator - hexColor()', () {
    final validator = StringValidator().hexColor();

    test('✅ Valid HEX Colors', () {
      expect(validator.validate('#000'), isNull); // Short HEX (3 chars)
      expect(validator.validate('#FFF'), isNull); // Short HEX (3 chars, uppercase)
      expect(validator.validate('#123'), isNull); // Short HEX (3 chars)
      expect(validator.validate('#abcdef'), isNull); // Full HEX (6 chars, lowercase)
      expect(validator.validate('#ABCDEF'), isNull); // Full HEX (6 chars, uppercase)
      expect(validator.validate('#123456'), isNull); // Full HEX (6 chars, mixed)
    });

    test('❌ Invalid HEX Colors', () {
      expect(validator.validate('123456'), "Invalid HEX color"); // Missing '#'
      expect(validator.validate('#12345'), "Invalid HEX color"); // 5 characters (invalid)
      expect(validator.validate('#1234567'), "Invalid HEX color"); // 7 characters (invalid)
      expect(validator.validate('#12G'), "Invalid HEX color"); // Contains non-hex character
      expect(validator.validate('#12!'), "Invalid HEX color"); // Special character
      expect(validator.validate(''), "Invalid HEX color"); // Empty string
      expect(validator.validate('#'), "Invalid HEX color"); // Just #
      expect(validator.validate('#1234'), "Invalid HEX color"); // 4 characters (invalid)
    });
  });

  group('StringValidator - base64()', () {
    final validator = StringValidator().base64();

    test('✅ Valid Base64 Strings', () {
      expect(validator.validate('TWFu'), isNull); // "Man" in Base64
      expect(validator.validate('TWFuIGlzIGRpc3Rpbmd1aXNoZWQ='), isNull); // "Man is distinguished" Base64
      expect(validator.validate('U3VjY2Vzcw=='), isNull); // "Success"
      expect(validator.validate('YW55IGNhcm5hbCBwbGVhcw=='), isNull); // "any carnal pleas"
      expect(validator.validate('YW55IGNhcm5hbCBwbGVhc3VyZQ=='), isNull); // "any carnal pleasure"
      expect(validator.validate('YW55IGNhcm5hbCBwbGVhc3Vy'), isNull); // No padding (valid)
    });

    test('❌ Invalid Base64 Strings', () {
      expect(validator.validate('TWFu*'), "Invalid Base64 format"); // Contains non-base64 character (*)
      expect(validator.validate('TWFu='), "Invalid Base64 format"); // Single padding character without proper length
      expect(validator.validate('TWFu==='), "Invalid Base64 format"); // Too many padding characters
      expect(validator.validate('TWFu=Z'), "Invalid Base64 format"); // Incorrect padding position
      expect(validator.validate(''), "Invalid Base64 format"); // Empty string
      expect(validator.validate('not base64 data!'), "Invalid Base64 format"); // Random invalid data
      expect(validator.validate('YW55IGNhcm5hbCBwbGVhc3VyZQ'), "Invalid Base64 format"); // Missing proper padding
    });
  });

  group('StringValidator - isPalindrome()', () {
    final validator = StringValidator().isPalindrome();

    test('✅ Valid Palindromes', () {
      expect(validator.validate('madam'), isNull); // Simple palindrome
      expect(validator.validate('racecar'), isNull); // Simple palindrome
      expect(validator.validate('A man, a plan, a canal, Panama'), isNull); // Ignoring spaces & punctuation
      expect(validator.validate('No lemon, no melon'), isNull); // Phrase with spaces
      expect(validator.validate('Was it a car or a cat I saw?'), isNull); // Sentence with punctuation
      expect(validator.validate('Able was I, I saw Elba'), isNull); // Mixed case
      expect(validator.validate('12321'), isNull); // Numeric palindrome
      expect(validator.validate(''), isNull); // Empty string is a valid palindrome
    });

    test('❌ Invalid Palindromes', () {
      expect(validator.validate('hello'), "String is not a palindrome"); // Not a palindrome
      expect(validator.validate('Palindrome'), "String is not a palindrome"); // Regular word
      expect(validator.validate('racecars'), "String is not a palindrome"); // Slightly altered word
      expect(validator.validate('12345'), "String is not a palindrome"); // Non-palindromic numbers
      expect(validator.validate('not a palindrome at all'), "String is not a palindrome"); // Long non-palindrome
    });
  });

  group('StringValidator - emoji()', () {
    final validator = StringValidator().emoji();

    test('✅ Valid Strings (Contain Emojis)', () {
      expect(validator.validate('😊'), isNull); // Single emoji
      expect(validator.validate('Hello 🌍!'), isNull); // Emoji mixed with text
      expect(validator.validate('🎉 Party time! 🎊'), isNull); // Multiple emojis
      expect(validator.validate('💡🔥🚀'), isNull); // Consecutive emojis
      expect(validator.validate('Good morning! ☀️'), isNull); // Emoji with punctuation
      expect(validator.validate('The weather is ❄️ today'), isNull); // Emoji in sentence
    });

    test('❌ Invalid Strings (No Emojis)', () {
      expect(validator.validate('Hello'), "Must contain at least one emoji"); // Plain text
      expect(validator.validate('123456'), "Must contain at least one emoji"); // Numbers only
      expect(validator.validate('Symbols !@#\$%^&*()'), "Must contain at least one emoji"); // Special characters
      expect(validator.validate(''), "Must contain at least one emoji"); // Empty string
      expect(validator.validate('No emojis here...'), "Must contain at least one emoji"); // Text with punctuation
    });
  });

  group('StringValidator - nanoid()', () {
    final validator = StringValidator().nanoid();

    test('✅ Valid NanoIDs', () {
      expect(validator.validate('abcdefghijklmno12345'), isNull); // Standard 21-char NanoID
      expect(validator.validate('NanoID_Example123'), isNull); // Valid with underscores
      expect(validator.validate('ABcdEFgH123_-'), isNull); // 14-char NanoID
      expect(validator.validate('Xyz1234567890_-'), isNull); // 15-char NanoID
    });

    test('❌ Invalid NanoIDs', () {
      expect(validator.validate('1234567'), "Invalid NanoID"); // Too short
      expect(validator.validate('invalid*id'), "Invalid NanoID"); // Invalid characters (* not allowed)
      expect(validator.validate(''), "Invalid NanoID"); // Empty string
      expect(validator.validate('ID With Space'), "Invalid NanoID"); // Spaces not allowed
    });
  });

  group('StringValidator - cuid()', () {
    final validator = StringValidator().cuid();

    test('✅ Valid CUIDs', () {
      expect(validator.validate('c123456789abcdefghijklmnopq'), isNull); // Valid CUID
      expect(validator.validate('cabcdef1234567890zxcvbnmlkj'), isNull); // Another valid CUID
      expect(validator.validate('c0987654321qwertyuiopasdfgh'), isNull); // Valid long CUID
    });

    test('❌ Invalid CUIDs', () {
      expect(validator.validate('123456789abcdefghijklmnopq'), "Invalid CUID"); // Missing 'c' prefix
      expect(validator.validate('c12345'), "Invalid CUID"); // Too short
      expect(validator.validate('C123456789abcdefghijklmnopq'), "Invalid CUID"); // Uppercase 'C'
      expect(validator.validate('c@#\$%^&*()_+=-{}|":?><'), "Invalid CUID"); // Special characters
      expect(validator.validate(''), "Invalid CUID"); // Empty string
      expect(validator.validate('c 123456789abcdefghijklmnopq'), "Invalid CUID"); // Space included
    });
  });

  group('StringValidator - cuid2()', () {
    final validator = StringValidator().cuid2();

    test('✅ Valid CUID2s', () {
      expect(validator.validate('123456789abcdefghijklmnopq'), isNull); // Valid CUID2
      expect(validator.validate('abcdef1234567890zxcvbnmlkj'), isNull); // Another valid CUID2
      expect(validator.validate('0987654321qwertyuiopasdfgh'), isNull); // Valid long CUID2
    });

    test('❌ Invalid CUID2s', () {
      expect(validator.validate('c123456789abcdefghijklmnopq'), "Invalid CUID2"); // Starts with 'c'
      expect(validator.validate('12345'), "Invalid CUID2"); // Too short
      expect(validator.validate('ABC123456789abcdefghijklmnopq'), "Invalid CUID2"); // Uppercase letters not allowed
      expect(validator.validate('123@#\$%^&*()_+=-{}|":?><'), "Invalid CUID2"); // Special characters
      expect(validator.validate(''), "Invalid CUID2"); // Empty string
      expect(validator.validate('123 456789abcdefghijklmnopq'), "Invalid CUID2"); // Space included
    });
  });

  group('ISO 8601 datetime validation', () {
    final isoDatetimeValidator = V.string().isoDatetime();

    test('Valid ISO 8601 datetime', () {
      final validDate = '2023-06-29T12:34:56Z';
      final result = isoDatetimeValidator.validate(validDate);
      expect(result, isNull); // No error for valid format
    });

    test('Invalid ISO 8601 datetime', () {
      final invalidDate = '2023-06-29T12:34:56'; // Missing 'Z'
      final result = isoDatetimeValidator.validate(invalidDate);
      expect(result, 'Invalid ISO 8601 datetime'); // Error message for invalid format
    });
  });
}
