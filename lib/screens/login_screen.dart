import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formModel = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Center(
        child: _form(),
      ),
    );
  }

  Widget _form() {
    return ReactiveForm(
      formGroup: _formModel,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ReactiveTextField(
              formControlName: 'email',
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            ReactiveTextField(
              formControlName: 'password',
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            ElevatedButton(
              key: const Key('submit'),
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  _submit() {
    print('Submit');
  }
}
