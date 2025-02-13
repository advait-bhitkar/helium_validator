import '../validator.dart';

/// `ListValidator` provides validation rules for lists of type `<T>`.
class ListValidator<T> extends Validator<List<T>> {

  /// Creates a [ListValidator] with a custom error message for invalid types.
  ListValidator({super.invalidTypeMessage = "Must be a valid list"});

  /// Ensures the list has at least [length] items.
  ListValidator<T> minLength(int length, {String? message}) {
    return addRule((value) =>
    (value != null && value.length < length)
        ? (message ?? "Must have at least $length items")
        : null
    ) as ListValidator<T>;
  }

  /// Ensures the list has at most [length] items.
  ListValidator<T> maxLength(int length, {String? message}) {
    return addRule((value) =>
    (value != null && value.length > length)
        ? (message ?? "Must have at most $length items")
        : null
    ) as ListValidator<T>;
  }

  /// Ensures the list has exactly [length] items.
  ListValidator<T> length(int length, {String? message}) {
    return addRule((value) =>
    (value != null && value.length != length)
        ? (message ?? "Must have exactly $length items")
        : null
    ) as ListValidator<T>;
  }

  /// Ensures all elements in the list are unique.
  ListValidator<T> unique({String message = "All elements must be unique"}) {
    return addRule((value) {
      if (value == null) return message;
      return value.toSet().length == value.length ? null : message;
    }) as ListValidator<T>;
  }

  /// Ensures the list contains [item].
  ListValidator<T> contains(T item, {String? message}) {
    return addRule((value) =>
    (value != null && !value.contains(item))
        ? (message ?? "Must contain $item")
        : null
    ) as ListValidator<T>;
  }

  @override
  List<T>? parseValue(String? input) {
    // TODO: implement parseValue
    throw UnimplementedError();
  }
}
