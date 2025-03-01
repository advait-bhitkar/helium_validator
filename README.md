# Helium Validator

A lightweight, powerful, and extensible validation library for Flutter.

If you find this library helpful, please consider supporting me by giving it a star on [GitHub](https://github.com/advait-bhitkar/helium_validator "GitHub").

## Introduction
Helium Flutter Validator is a powerful and flexible validation library for Flutter.

It provides a fluent API for defining validation rules for strings, numbers, lists, objects, booleans, and dates. You can also extend it to define your own custom validators.

### Features
-   Predefined validation rules for common data types.
-   Support for custom validation functions.
-   Lightweight and easy to integrate.
-   Works with flutter forms.
-  Customize error messages.

## Installation
To use this validation library in your Dart or Flutter project, follow these steps:


Add the dependency to your `pubspec.yaml`:

```yaml  
dependencies:  
 helium_validator: 0.0.8  
```  

Then, run:

```sh  
flutter pub get
```  

## Getting Started Guide

### **Basic Example**
```dart  
import 'package:helium_validator/helium_validator.dart';

// define the validator
// chain to add rules
var emailValidator = V.string().required().email();
var ageValidator = V.number().required().min(18);

// use .validate for validation
print(ageValidator.validate('22'));
print(ageValidator.validate('3'));

print(emailValidator.validate("advait@gmail.com"));
print(emailValidator.validate("advaitgmail.com"));
```   

Output :
```
 null
 Must be at least 18
 null
 Invalid email
```

> The validator will return `null`, if no validation error occurs, if there is any error it will return the error in string format.

> To return all the validation errors you can pass the arg - `returnAllErrors = true` this will return all the errors as list.

**Return all validation errors**

```dart  
import 'package:helium_validator/helium_validator.dart';

// define the validator
  var ageValidator = V.number().required().min(18).isPrime();

// use validate for validation
print(ageValidator.validate(returnAllErrors: true, '22'));
print(ageValidator.validate(returnAllErrors: true, '8'));

print(ageValidator.validate(returnAllErrors: true, returnAsList: true, '22'));
print(ageValidator.validate(returnAllErrors: true, returnAsList: true, '8'));
```   

Output:
```
 Must be a prime number
 Must be at least 18, Must be a prime number
 [Must be a prime number]
 [Must be at least 18, Must be a prime number]
```
> `returnAsList` if true will return the erros as a list, or as a single string and will comibine mutiple errors in a string/

## Using with Flutter forms
The library support direct working with flutter forms, just use .build()

```dart
var ageValidator = V.required().min(18);

TextFormField(  
  decoration: InputDecoration(labelText: 'Age'),  
  validator: ageValidator.build(),  
),
```

## Available Validators
The library has following build in validators

### **1 String Validators**
```dart  
V.string().required().minLength(3) .maxLength(20).email();  
```  
Available String Validators
``` dart
 required() // Ensures the field is not null or empty
 minLength() // Ensures the string has at least [length] characters.
 maxLength() // Ensures the string has at most [length] characters.
 length() // Ensures the string has exactly [length] characters.
 email() /// Validates that the string is a properly formatted email.
 url() // Validates that the string is a properly formatted URL.
 contains() /// Ensures the string contains the [expected] substring.
 startsWith() // /// Ensures the string starts with the given [prefix].
 uuid() /// Ensures the string is a valid UUID (v4 format).
 datetime() /// Ensures the string is a valid datetime (YYYY-MM-DD HH:mm:ss).
 date() /// Ensures the string is a valid date (YYYY-MM-DD).
 time() /// Ensures the string is a valid time (HH:mm:ss).
 ip() /// Ensures the string is a valid IP address (IPv4 or IPv6).
 cidr() /// Ensures the string is a valid CIDR notation.
 json() /// Ensures the string is a valid JSON.
 ascii() /// Ensures the string contains only ASCII characters.
 alpha() /// Ensures the string contains only alphabetic characters (A-Z, a-z).
 alphanumeric() /// Ensures the string contains only alphanumeric characters (A-Z, a-z, 0-9).
 isNumeric() /// Ensures string contains only numeric digits (0-9)
 slug() /// Ensures the string is a valid slug (lowercase,   alphanumeric, hyphens).
 creditCard() /// Ensures the string is a valid credit card number.
 phoneNumber() /// Ensures the string is a valid phone number.
 hexColor() /// Ensures the string is a valid hexadecimal color.
 base64() /// Ensures the string is in valid Base64 encoding.
 isPalindrome() /// Ensures the string is a palindrome (reads the same forward and backward).
 emoji() /// Validates that the string contains at least one emoji.
 nanoid() /// Validates that the string is a valid NanoID (alphanumeric, underscore, or hyphen, with at least 10 characters).
 cuid() /// Validates that the string is a valid CUID (must start with 'c' followed by at least 24 lowercase alphanumeric characters).
 cuid2() /// Validates that the string is a valid CUID2 (24+ lowercase alphanumeric characters, excluding 'c' as the first character).
 isoDatetime() /// Validates that the string follows the ISO 8601 datetime format (e.g., "2023-06-29T12:34:56Z").
```

### **2 Number Validators**
```dart  
V.number().required().min(18).max(99).positive().even();  
```  

Available Number Validators
```dart
 required() /// Ensures the value is required (not null or NaN).
min() /// Ensures the value is at least [minValue].
max() /// Ensures the value is at most [maxValue].
positive() /// Ensures the value is positive (> 0).
negative() /// Ensures the value is negative (< 0).
notZero() /// Ensures the value is not zero.
even() /// Ensures the value is an even number.
odd() /// Ensures the value is an odd number.
precision() /// Ensures the value has at most [decimalPlaces] decimal places.
isFinite() /// Ensures the value is a finite number (not infinite or NaN).
isWholeNumber() /// Ensures the value is a whole number (integer).
between() /// Ensures the value is between [minValue] and [maxValue], inclusive.
multipleOf() /// Ensures the value is a multiple of [factor].
safe() /// Ensures the value is within a safe integer range.
isPalindrome() /// Ensures the number is a palindrome (reads the same forward and backward).
isPrime() /// Ensures the number is a prime number.
equalTo() /// Ensures the value is equal to [targetValue].
notEqualTo() /// Ensures the value is not equal to [targetValue].
absoluteValueMax() /// Ensures the absolute value is at most [maxValue].
```


### **3 Boolean Validators**
```dart  
V.boolean().isTrue();  
```  
Available Boolean Validators
```dart
 isTrue() /// Ensures the value is `true`.
isFalse() /// Ensures the value is `false`.
isTruthy() /// Ensures the value is truthy (e.g., "true", "yes", "on", "1").
isFalsy() /// Ensures the value is falsy (e.g., "false", "no", "off", "0").
matches() /// Ensures the value matches a specific boolean expectation.
not() /// Ensures the value does **not** match a specific boolean expectation.
xor() /// Ensures the value follows XOR logic with the given boolean.
equals() /// Ensures the value is exactly equal to the expected boolean.
notNull() /// Ensures the value is not null.

```

### **4 List Validators**
```dart  
V.list().minLength(2).maxLength(5).contains("item");  
```  
Available List Validators
```dart
 minLength() /// Ensures the list has at least [length] items.
maxLength() /// Ensures the list has at most [length] items.
length() /// Ensures the list has exactly [length] items.
unique() /// Ensures all elements in the list are unique.
contains() /// Ensures the list contains [item].
```

### **5 Object Validation**
```dart  
V.object({
"name": V.string().required(), "age": V.number().min(18),});  
```  

Available Object Validators
```dart
 shape() /// Defines the structure of the expected object. Throws an [ArgumentError] if duplicate keys are added.
exactKeys() /// Ensures that only the specified [keys] are allowed in the object.
allowExtraKeys() /// Allows the object to have extra keys beyond the defined schema.
optionalFields() /// Specifies which fields are optional in the object.
nonEmpty() /// Ensures the object is not empty.
customValidation() /// Adds a custom validation rule that checks the entire object.
deepEqual() /// Ensures the object matches the given [other] object exactly.
```

### **6 Date Validators**

```dart  
V.object({
"name": V.string().required(), "age": V.number().min(18),});  
```  

Available Date Validators
```dart
 required() /// Ensures the date is not null or empty.
before() /// Ensures the date is before the given [date].
after() /// Ensures the date is after the given [date].
between() /// Ensures the date falls between [start] and [end].
exact() /// Ensures the date is exactly the given [target] date.
notExact() /// Ensures the date is not exactly the given [target] date.
weekdayOnly() /// Ensures the date falls on a weekday (Monday–Friday).
futureOnly() /// Ensures the date falls on a weekend (Saturday or Sunday).
pastOnly() /// Ensures the date is in the past.
```

## Customize


## Error Handling


## Custom Validator

## Composite Validator

---
title: Composite Validator Example
description: Learn how to use the CompositeValidator to combine multiple validation rules.
---

# Example: Using the CompositeValidator

The `CompositeValidator` allows you to apply multiple validation rules from different validators to a single value.

## Code Example

```dart
import 'package:validator_lib/validator_lib.dart';

void main() {
  // Create individual validators 
  final numberValidator = V.number().isInteger();
  final rangeValidator = V.number().min(10).max(100);
  // Combine them using CompositeValidator 
  final compositeValidator = CompositeValidator<int>([ numberValidator, rangeValidator, ]);
  // Validate different inputs 
  compositeValidator.validate("25");  // ✅ Valid
  compositeValidator.validate("5");   // ❌ Must be at least 10
  compositeValidator.validate("150"); // ❌ Must be at most 100
  compositeValidator.validate("abc"); // ❌ Invalid number format}  
```

## 🔥 Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this library.
  
---  

## 📜 License

This project is licensed under the MIT License.  
 