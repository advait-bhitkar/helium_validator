import 'package:flutter/material.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';
import 'package:helium_flutter_validator/src/composite_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Validator Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  var emailValidator = V.string().required().email();
  var ageValidator = NumberValidator().required().isWholeNumber();
  // var ageValidator2 = V.number().required().isWholeNumber().max(8);

  void validateList(ListValidator<int> validator, List<int> list) {
    for (var rule in validator.rules) {
      String? error = rule(list);
      if (error != null) {
        print("❌ Validation failed: $error");
        return;
      }
    }
    print("✅ Validation passed: $list");
  }

  @override
  Widget build(BuildContext context) {

    print(ageValidator.validate('abc'));
    print(ageValidator.validate(''));
    print(ageValidator.validate('22'));
    print(ageValidator.validate('3'));
    print(ageValidator.validateStrict(22));
    print(ageValidator.validate(double.nan));
    print(ageValidator.validate(null));
    print(ageValidator.validate(-12));
    print(emailValidator.validate(-12));
    print(emailValidator.validate(""));
    print(emailValidator.validate("23"));
    print(emailValidator.validate(null));
    print(emailValidator.validate("advait@gmail.com"));
    print(emailValidator.validate(" "));

    // Create a ListValidator for integers
    var validator = ListValidator<int>()
        .minLength(2, message: "List must have at least 2 items")
        .maxLength(5, message: "List must have at most 5 items")
        .unique(message: "List items must be unique")
        .contains(3, message: "List must contain the number 3");

    // Test cases
    validateList(validator, [1, 2]); // ❌ Must contain 3
    validateList(validator, [1, 2, 3]); // ✅ Valid
    validateList(validator, [1, 2, 3, 3]); // ❌ Unique check fails
    validateList(validator, [1, 2, 3, 4, 5, 6]); // ❌ Max length exceeded
    validateList(validator, []); // ❌ Min length fails

    // Example with parseValue
    List<int>? parsedList = validator.parseValue("1, 2, 3");
    print("Parsed List: $parsedList"); // Parsed List: [1, 2, 3]

    final lValidator = V.list().length(2);
    print(lValidator.validate([]));

    // final intValidator = CustomValidator<int>()
    //   ..addRule((value) => value != null && value < 0 ? "Must be non-negative" : null);

    // print(intValidator.validate(5));  // 123
    // print(intValidator.validate(-1));       // "Must be non-negative" (invalid)
     // final comValidator = CompositeValidator([ageValidator2, ageValidator]);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            // validator: emailValidator.build(),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: 'Age'),
            validator: ageValidator.build(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form is valid!')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
