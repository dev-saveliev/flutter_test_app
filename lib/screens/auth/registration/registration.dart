import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'registration.gform.dart';

@Rf()
/*@RfGroup(
  validators: [MustMatchValidator()],
)
 */
class Registration {
  final String email;
  final String password;

  const Registration({
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.email = '',

    @RfControl(
      validators: [RequiredValidator()],
    )
    this.password = '',
  });

  @override
  List<Object?> get props => [email, password];
}