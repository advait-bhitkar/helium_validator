import 'dart:convert';
import '../validator.dart';

/// A validator for string values, providing various validation rules such as length constraints,
/// format checks (email, URL, UUID), and pattern matching.
class StringValidator extends Validator<String> {
  /// Creates a [StringValidator] with a custom error message for invalid types.
  StringValidator({super.invalidTypeMessage = "Must be a valid string"});

  /// Ensures the field is not null or empty.
  StringValidator required({String message = "Field is required"}) {
    return addRule((value) =>
    (value == null || value.trim().isEmpty) ? message : null) as StringValidator;
  }

  /// Ensures the string has at least [length] characters.
  StringValidator minLength(int length, {String? message}) {
    return addRule((value) => value != null && value.length < length
        ? (message ?? "Must be at least $length characters")
        : null) as StringValidator;
  }

  /// Ensures the string has at most [length] characters.
  StringValidator maxLength(int length, {String? message}) {
    return addRule((value) => value != null && value.length > length
        ? (message ?? "Must be at most $length characters")
        : null) as StringValidator;
  }

  /// Ensures the string has exactly [length] characters.
  StringValidator length(int length, {String? message}) {
    return addRule((value) => value != null && value.length != length
        ? (message ?? "Must be exactly $length characters")
        : null) as StringValidator;
  }

  /// Validates that the string is a properly formatted email.
  StringValidator email({String message = "Invalid email"}) {
    return regex(RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'), message: message);
  }

  /// Validates that the string is a properly formatted URL.
  StringValidator url({String message = "Invalid URL"}) {
     return regex(RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$'), message: message);
  }

  /// Ensures the string matches the provided [pattern].
  StringValidator regex(RegExp pattern, {String message = "Invalid format"}) {
    return addRule(
            (value) => value != null && !pattern.hasMatch(value) ? message : null)
    as StringValidator;
  }

  /// Ensures the string contains the [expected] substring.
  StringValidator contains(String expected, {String? message}) {
    return addRule((value) =>
    value != null && !value.contains(expected)
        ? (message ?? "Must contain '$expected'")
        : null) as StringValidator;
  }

  /// Ensures the string starts with the given [prefix].
  StringValidator startsWith(String prefix, {String? message}) {
    return addRule((value) =>
    value != null && !value.startsWith(prefix)
        ? (message ?? "Must start with '$prefix'")
        : null) as StringValidator;
  }

  /// Ensures the string ends with the given [suffix].
  StringValidator endsWith(String suffix, {String? message}) {
    return addRule((value) =>
    value != null && !value.endsWith(suffix)
        ? (message ?? "Must end with '$suffix'")
        : null) as StringValidator;
  }

  /// Ensures the string is a valid UUID (v4 format).
  StringValidator uuid({String message = "Invalid UUID"}) {
    return regex(
        RegExp(
            r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'),
        message: message);
  }

  /// Ensures the string is a valid datetime (YYYY-MM-DD HH:mm:ss).
  StringValidator datetime({String message = "Invalid datetime"}) {
    return regex(RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$'),
        message: message);
  }

  /// Ensures the string is a valid date (YYYY-MM-DD).
  StringValidator date({String message = "Invalid date"}) {
    return regex(RegExp(r'^\d{4}-\d{2}-\d{2}$'), message: message);
  }

  /// Ensures the string is a valid time (HH:mm:ss).
  StringValidator time({String message = "Invalid time"}) {
    return regex(RegExp(r'^\d{2}:\d{2}:\d{2}$'), message: message);
  }

  /// Ensures the string is a valid IP address (IPv4 or IPv6).
  StringValidator ip({String message = "Invalid IP address"}) {
    return regex(
        RegExp(
            r'^(?:\d{1,3}\.){3}\d{1,3}$|^([a-f0-9:]+:+)+[a-f0-9]+$'),
        message: message);
  }

  /// Ensures the string is a valid CIDR notation.
  StringValidator cidr({String message = "Invalid CIDR notation"}) {
    return regex(
        RegExp(
            r'^(?:\d{1,3}\.){3}\d{1,3}/(3[0-2]|[12]?[0-9])$' // IPv4 with /0-32
            r'|^(([0-9a-fA-F]{1,4}:){1,7}:?|::|([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4})/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$', // IPv6 with /0-128
            ), message: message);
    }

  /// Ensures the string is a valid JSON.
  StringValidator json({String message = "Invalid JSON"}) {
    return addRule((value) {
      if (value == null) return message;
      try {
        jsonDecode(value);
        return null;
      } catch (_) {
        return message;
      }
    }) as StringValidator;
  }

  /// Ensures the string contains only ASCII characters.
  StringValidator ascii({String message = "Must contain only ASCII characters"}) {
    return regex(RegExp(r'^[\x00-\x7F]+$'), message: message);
  }

  /// Ensures the string contains only alphabetic characters (A-Z, a-z).
  StringValidator alpha({String message = "Must contain only letters"}) {
    return regex(RegExp(r'^[a-zA-Z]+$'), message: message);
  }

  /// Ensures the string contains only alphanumeric characters (A-Z, a-z, 0-9).
  StringValidator alphanumeric({String message = "Must contain only letters and numbers"}) {
    return regex(RegExp(r'^[a-zA-Z0-9]+$'), message: message);
  }

  /// Ensures string contains only numeric digits (0-9)
  StringValidator isNumeric({String message = "Must contain only numbers"}) {
    return regex(RegExp(r'^\d+$'), message: message);
  }

  /// Ensures the string is a valid slug (lowercase, alphanumeric, hyphens).
  StringValidator slug({String message = "Invalid slug"}) {
    return regex(RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$'), message: message);
  }

  /// Ensures the string is a valid credit card number.
  StringValidator creditCard({String message = "Invalid credit card"}) {
    return regex(
        RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9]{2})[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$'),
        message: message);
  }

  /// Ensures the string is a valid phone number.
  StringValidator phoneNumber({String message = "Invalid phone number"}) {
    return regex(RegExp(r'^\+?[0-9]{7,15}$'), message: message);
  }

  /// Ensures the string is a valid hexadecimal color.
  StringValidator hexColor({String message = "Invalid HEX color"}) {
    return regex(RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$'), message: message);
  }

  /// Ensures the string is in valid Base64 encoding.
  StringValidator base64({String message = "Invalid Base64 format"}) {
    return regex(RegExp(r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$'), message: message);
  }

  /// Ensures the string is a palindrome (reads the same forward and backward).
  StringValidator isPalindrome({String message = "String is not a palindrome"}) {
    return addRule((value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      String normalized = value.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
      String reversed = normalized.split('').reversed.join('');
      return normalized == reversed ? null : message;
    }) as StringValidator;
  }

  StringValidator emoji({String message = "Must contain at least one emoji"}) {
    return regex(RegExp(r'[\u1F600-\u1F64F\u1F300-\u1F5FF\u1F680-\u1F6FF\u2600-\u26FF\u2700-\u27BF]+'), message: message);
  }

  StringValidator nanoid({String message = "Invalid NanoID"}) {
    return regex(RegExp(r'^[a-zA-Z0-9_-]{21}$'), message: message);
  }

  StringValidator cuid({String message = "Invalid CUID"}) {
    return regex(RegExp(r'^c[0-9a-z]{24,}$'), message: message);
  }

  StringValidator cuid2({String message = "Invalid CUID2"}) {
    return regex(RegExp(r'^[0-9a-z]{24,}$'), message: message);
  }

  StringValidator isoDatetime({String message = "Invalid ISO 8601 datetime"}) {
    return regex(RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d+)?Z$'), message: message);
  }

  @override
  String? parseValue(String? input) {
    return input;
  }
}
