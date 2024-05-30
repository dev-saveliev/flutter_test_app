import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/auth/registration/registration.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'labels.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  Registration _emptyModel = Registration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Registration'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen by popping the current route
            context.pop();
          },
        ),
//        title: Text('My App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RegistrationFormBuilder(
          model: _emptyModel,
          builder: (context, formModel, child) {
            return Column(
              children: [
                ReactiveTextField<String>(
                  key: email.itemKey,
                  formControl: formModel.emailControl,
                  validationMessages: {
                    ValidationMessage.required: (_) => errorRequired
                  },
                  decoration: InputDecoration(
                    labelText: email.name,
                    helperText: '',
                    helperStyle: const TextStyle(height: 0.8),
                    errorStyle: const TextStyle(height: 0.8),
                  ),
                ),
                const SizedBox(height: 8.0),
                ReactiveTextField<String>(
                  key: password.itemKey,
                  formControl: formModel.passwordControl,
                  obscureText: true,
                  validationMessages: {
                    ValidationMessage.required: (_) => errorRequired,
                    'mustMatch': (_) => errorMustMatch,
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: password.name,
                    helperText: '',
                    helperStyle: const TextStyle(height: 0.8),
                    errorStyle: const TextStyle(height: 0.8),
                  ),
                ),
                ElevatedButton(
                  key: submit.itemKey,
                  onPressed: formModel.form.valid
                      ? () {
                          debugPrint((formModel).model.toString());
                          debugPrint(formModel.model.email);
                          debugPrint(formModel.model.password);
                          //widget.onChange?.call(formModel.model);
                        }
                      : null,
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
