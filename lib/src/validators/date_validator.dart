import 'package:intl/intl.dart';
import '../validator.dart';

/// `DateValidator` provides validation rules for date values in `yyyy-MM-dd` format.
class DateValidator extends Validator<String> {
  late final DateFormat _dateFormat;

  /// Creates a `DateValidator` with a **custom date format** (default: `yyyy-MM-dd`).
  DateValidator({String format = 'yyyy-MM-dd'}) {
    _dateFormat = DateFormat(format);
  }

  /// Ensures the date is not null or empty.
  DateValidator required({String message = "Date is required"}) {
    return addRule((value) =>
    (value == null || value.trim().isEmpty) ? message : null
    ) as DateValidator;
  }

  /// Ensures the date is before the given [date].
  DateValidator before(DateTime date, {String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return parsedDate.isBefore(date)
          ? null
          : (message ?? "Must be before ${_formatDate(date)}");
    }) as DateValidator;
  }

  /// Ensures the date is after the given [date].
  DateValidator after(DateTime date, {String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return parsedDate.isAfter(date)
          ? null
          : (message ?? "Must be after ${_formatDate(date)}");
    }) as DateValidator;
  }

  /// Ensures the date falls between [start] and [end].
  DateValidator between(DateTime start, DateTime end, {String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return (parsedDate.isAfter(start) && parsedDate.isBefore(end))
          ? null
          : (message ?? "Must be between ${_formatDate(start)} and ${_formatDate(end)}");
    }) as DateValidator;
  }

  /// Ensures the date is exactly the given [target] date.
  DateValidator exact(DateTime target, {String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return parsedDate.isAtSameMomentAs(target)
          ? null
          : (message ?? "Must be exactly ${_formatDate(target)}");
    }) as DateValidator;
  }

  /// Ensures the date is not exactly the given [target] date.
  DateValidator notExact(DateTime target, {String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return !parsedDate.isAtSameMomentAs(target)
          ? null
          : (message ?? "Must not be exactly ${_formatDate(target)}");
    }) as DateValidator;
  }

  /// Ensures the date falls on a weekday (Monday–Friday).
  DateValidator weekdayOnly({String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return (parsedDate.weekday >= DateTime.monday && parsedDate.weekday <= DateTime.friday)
          ? null
          : (message ?? "Must be a weekday (Monday to Friday)");
    }) as DateValidator;
  }

  /// Ensures the date falls on a weekend (Saturday or Sunday).
  DateValidator weekendOnly({String? message}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return (parsedDate.weekday == DateTime.saturday || parsedDate.weekday == DateTime.sunday)
          ? null
          : (message ?? "Must be a weekend (Saturday or Sunday)");
    }) as DateValidator;
  }

  /// Ensures the date is in the future.
  DateValidator futureOnly({String message = "Must be a future date"}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return parsedDate.isAfter(DateTime.now()) ? null : message;
    }) as DateValidator;
  }

  /// Ensures the date is in the past.
  DateValidator pastOnly({String message = "Must be a past date"}) {
    return addRule((value) {
      final parsedDate = _parseDate(value);
      if (parsedDate == null) return "Invalid date format";
      return parsedDate.isBefore(DateTime.now()) ? null : message;
    }) as DateValidator;
  }

  /// Parses a date from a String using `yyyy-MM-dd` format.
  DateTime? _parseDate(String? value) {
    if (value == null) return null;
    try {
      return _dateFormat.parse(value);
    } catch (_) {
      return null; // Invalid format
    }
  }

  /// Formats a `DateTime` object as a `yyyy-MM-dd` string.
  String _formatDate(DateTime date) {
    return _dateFormat.format(date);
  }
}
