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

  var emailValidator = V.string().required().email().alpha();
  var ageValidator = V.number().required().min(18);
  var ageValidator2 = V.number().required().isWholeNumber().max(8);


  @override
  Widget build(BuildContext context) {

    final intValidator = CustomValidator<int>()
      ..addRule((value) => value != null && value < 0 ? "Must be non-negative" : null);

    print(intValidator.validate(5));  // 123
    print(intValidator.validate(-1));       // "Must be non-negative" (invalid)
     final comValidator = CompositeValidator([ageValidator2, ageValidator]);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: emailValidator.build(),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
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
