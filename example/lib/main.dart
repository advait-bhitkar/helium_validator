import 'package:flutter/material.dart';
import 'package:helium_flutter_validator/helium_flutter_validator.dart';
import 'package:helium_flutter_validator/src/composite_validators.dart';

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


  @override
  Widget build(BuildContext context) {

    final nameValidator = CompositeValidator([emailValidator, ageValidator]);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: nameValidator.buildListValidator(),
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
