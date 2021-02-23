part of 'auth_bloc.dart';

// Solo tenemos dos eventos.
// authCheckRequested, para verificar si existe un usuario logeado
// signedOut para deslogearnos
@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.signedOut() = SignedOut;
}
