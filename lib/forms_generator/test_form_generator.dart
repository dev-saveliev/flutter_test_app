import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'test_form_generator.gform.dart';

@Rf()
class Basic {
  final String email;
  final String password;

  Basic({
    @RfControl() this.email = '',
    @RfControl() this.password = '',
  });
}
