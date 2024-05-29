import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

@Rf()
class Basic {
  final String email;
  final String password;

  Basic({
    @RfControl() this.email = '',
    @RfControl() this.password = '',
  });
}
