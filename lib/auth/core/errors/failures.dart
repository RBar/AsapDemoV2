// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// Failures que podemos llegar a tener en los Value Objects
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}

// Failures que podemos llegar a tener a la hora de realizar la autenticacion.
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.canceledByUser() = CanceledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailandPasswordCombination() =
      InvalidEmailandPasswordCombination;
}
