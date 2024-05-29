import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/router/router_configuration.dart';
import 'package:flutter_test_app/screens/login/login_logic.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum FormFields { email, password }

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _form = FormGroup({
    FormFields.email.name: FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    FormFields.password.name: FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  final _logic = LoginLogic();

  @override
  Widget build(BuildContext context) {
    _handleOnNextScreenEvent();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Center(
        child: _buildForm(),
      ),
    );
  }

  _handleOnNextScreenEvent() {
    ref.listen(_logic.onLoginProvider, (prev, next) {
      if (next == true) {
        context.go(RouteName.main.path);
      }
    });
  }

  Widget _buildForm() {
    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ReactiveTextField(
              formControlName: FormFields.email.name,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            ReactiveTextField(
              formControlName: FormFields.password.name,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: _form!.valid ? () => _logic.login(
                    login: _form.control(FormFields.email.name).value,
                    password: _form.control(FormFields.password.name).value,
                    ref: ref,
                  ) : null,
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
