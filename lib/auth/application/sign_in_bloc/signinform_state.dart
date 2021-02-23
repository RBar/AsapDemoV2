part of 'signinform_bloc.dart';
// emailAddress: contiene el email
// password: contiene el password
// showErrorMessages: nos dice cuando mostrar errores en el input, email invalido, password corto, etc
// isSubmitting: nos dice cuando se esta enviando la informacion, en caso de que queramos mostrar un progress bar
// reset: nos dice cuando se ha reseteado nuestro password
// authFailureOrSuccess: nos dice si el usuario se ha podidio logear exitosamente o hay un Auth failured.
// Unit es como un void, pero se utiliza unit porque es una clase.

@freezed
abstract class SigninformState with _$SigninformState {
  const factory SigninformState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required bool reset,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccess,
  }) = _SigninformState;
  factory SigninformState.initial() => SigninformState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        reset: false,
        authFailureOrSuccess: none(),
      );
}
