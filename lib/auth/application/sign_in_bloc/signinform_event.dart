part of 'signinform_bloc.dart';

// Emailchanged: actualiza el valor del email una vez se ingrese algo al input
//passwordchanged: actualiza el valor del email una vez se ingrese algo al input
// registerWithEmailAndPasswordPressed: evento al presionar register con email y password
// signInWithEmailAndPasswordPressed: evento al presionar sign in con email y password
// signInWithGooglePressed: para logearnos con google
// resetPasswordWithEmail: para resetear nuestro password
@freezed
abstract class SigninformEvent with _$SigninformEvent {
  const factory SigninformEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SigninformEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SigninformEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SigninformEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SigninformEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
  const factory SigninformEvent.resetPasswordWithEmail() =
      ResetPasswordWithEmail;
}
