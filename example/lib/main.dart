import 'package:flutter/material.dart';
import 'package:helium_validator/helium_validator.dart';

void main() {
  runApp(const HeliumValidatorPreviewApp());
}

class HeliumValidatorPreviewApp extends StatelessWidget {
  const HeliumValidatorPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helium Validator Preview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const ValidatorFormPage(),
    );
  }
}

class ValidatorFormPage extends StatefulWidget {
  const ValidatorFormPage({super.key});

  @override
  State<ValidatorFormPage> createState() => _ValidatorFormPageState();
}

class _ValidatorFormPageState extends State<ValidatorFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();

  // Built-in validators
  final emailValidator = V.string().required().email();
  final ageValidator = V.number().required().min(18).isWholeNumber();

  // Custom validator with multiple rules
  final passwordValidator = V.custom()
    ..addRule((value) => (value ?? "").isEmpty ? "Password is required" : null)
    ..addRule((value) => (value?.length ?? 0) < 8 ? "Must be at least 8 characters" : null)
    ..addRule((value) => !RegExp(r'[A-Z]').hasMatch(value ?? "") ? "Must contain uppercase letter" : null)
    ..addRule((value) => !RegExp(r'[0-9]').hasMatch(value ?? "") ? "Must contain number" : null)
    ..addRule((value) => !RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value ?? "") ? "Must contain special character" : null);

  @override
  void dispose() {
    _emailController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All inputs are valid!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Helium Validator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Validation Form',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'you@example.com',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator.build(),
              ),
              const SizedBox(height: 20),

              // Age field
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  hintText: 'e.g. 25',
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number,
                validator: ageValidator.build(),
              ),
              const SizedBox(height: 20),

              // Password field (custom validator)
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: '••••••••',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: passwordValidator.build(),
              ),
              const SizedBox(height: 30),

              // Submit button
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.check),
                label: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
