<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.




////////////////////////////////////////////////////////////////

# Helium Flutter Validator - Documentation

## Introduction
Helium Flutter Validator is a powerful and flexible validation library for Flutter, inspired by Zod. It provides a fluent API for defining validation rules for various data types, including strings, numbers, booleans, lists, objects, and dates. This documentation details all available validators and how to integrate them into your Flutter applications.

## Installation

To use Helium Flutter Validator, add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  helium_flutter_validator: latest_version
```

Then, run:

```sh
flutter pub get
```

## Key Features
- Chainable validation methods
- Supports various data types: String, Number, Boolean, List, Object, and Date
- Customizable error messages for each validation rule
- Integration with Flutter Forms
- Extendable for custom validation logic

## Getting Started

### Basic Usage

```dart
import 'package:helium_flutter_validator/helium_flutter_validator.dart';

final emailValidator = V.string()
  .required()
  .email()
  .maxLength(50);

void main() {
  print(emailValidator.validate("test@example.com")); // null (Valid)
  print(emailValidator.validate("invalid-email")); // "Invalid email address"
}
```

## Validators

### 1. String Validators
```dart
V.string()
  .required()
  .minLength(3)
  .maxLength(20)
  .email()
  .url()
  .regex(RegExp(r'^[a-zA-Z0-9]+'));
```

### 2. Number Validators
```dart
V.number()
  .required()
  .min(18)
  .max(99)
  .positive()
  .int()
  .even();
```

### 3. Boolean Validators
```dart
V.boolean().isTrue();
```

### 4. List Validators
```dart
V.list().minLength(2).maxLength(5).contains("item");
```

### 5. Object Validation
```dart
V.object({
  "name": V.string().required(),
  "age": V.number().min(18),
});
```

### 6. Date Validators
```dart
V.date()
  .before(DateTime(2025, 1, 1))
  .after(DateTime(2000, 1, 1))
  .between(DateTime(2000, 1, 1), DateTime(2025, 1, 1));
```

## Flutter Form Integration

To use the validator within a `TextFormField`, use the `build()` method:

```dart
TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: emailValidator.build(),
)
```

## Custom Validators

You can create custom validation rules using `custom()`:

```dart
V.string().custom((value) => value == "special" ? null : "Must be 'special'");
```

## Error Handling

Each validator returns `null` when the value is valid. Otherwise, it returns an error message:

```dart
final result = emailValidator.validate("invalid-email");
if (result != null) {
  print("Error: $result");
}
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License.

Happy Coding! 🚀

