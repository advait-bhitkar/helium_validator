# Helium Flutter Validator

A powerful and flexible validation library for Flutter inspired by [Zod](https://github.com/colinhacks/zod). It provides a fluent API for defining validation rules for strings, numbers, lists, objects, and dates.

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  helium_flutter_validator: latest_version
```

Then, run:

```sh
flutter pub get
```

## 🚀 Features

✅ Chainable validation methods  
✅ Supports **string, number, boolean, list, object, and date** validations  
✅ Custom error messages for each validation rule  
✅ Easily extendable for custom validation logic

---

## 🛠 Usage

### **Basic Example**
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

---

## 📝 Available Validators

### **1️⃣ String Validators**
```dart
V.string()
  .required()
  .minLength(3)
  .maxLength(20)
  .email()
  .url()
  .regex(RegExp(r'^[a-zA-Z0-9]+'));
```

### **2️⃣ Number Validators**
```dart
V.number()
  .required()
  .min(18)
  .max(99)
  .positive()
  .int()
  .even();
```

### **3️⃣ Boolean Validators**
```dart
V.boolean().isTrue();
```

### **4️⃣ List Validators**
```dart
V.list().minLength(2).maxLength(5).contains("item");
```

### **5️⃣ Object Validation**
```dart
V.object({
  "name": V.string().required(),
  "age": V.number().min(18),
});
```

---

## 🛠 Using with Flutter Forms

```dart
TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: emailValidator.build(),
)
```

---

## 🔥 Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this library.

---

## 📜 License

This project is licensed under the MIT License.

Happy Coding! 🚀

