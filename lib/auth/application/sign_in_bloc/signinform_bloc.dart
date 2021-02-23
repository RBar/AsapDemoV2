// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

// Project imports:
import '../../core/errors/failures.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/value_objects.dart';

part 'signinform_bloc.freezed.dart';
part 'signinform_event.dart';
part 'signinform_state.dart';

@injectable
class SigninformBloc extends Bloc<SigninformEvent, SigninformState> {
  final IAuthFacade _authFacade;

  SigninformBloc(this._authFacade) : super(SigninformState.initial());

  @override
  Stream<SigninformState> mapEventToState(
    SigninformEvent event,
  ) async* {
    yield* event.map(emailChanged: (event) async* {
      // Se emite el nuevo valor del email.
      yield state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccess: none(),
      );
    }, passwordChanged: (event) async* {
      // Se emite el nuevo valor del password.
      yield state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccess: none(),
      );
    }, registerWithEmailAndPasswordPressed: (event) async* {
      Either<AuthFailure, Unit> failureOrSuccess;
      //en caso de que el email  y el password sean validos se emite el isSubmitting
      if (state.emailAddress.isValid() && state.password.isValid()) {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );
        // se realiza el registro
        failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
            emailAddress: state.emailAddress, password: state.password);
      }
      // se emite el nuevo valor de authFailureOrSuccess
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }, signInWithEmailAndPasswordPressed: (event) async* {
      Either<AuthFailure, Unit> failureOrSuccess;
      //en caso de que el email  y el password sean validos se emite el isSubmitting
      if (state.emailAddress.isValid() && state.password.isValid()) {
        yield state.copyWith(
          isSubmitting: true,
          reset: false,
          authFailureOrSuccess: none(),
        );
        // se realiza el logeo
        failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
            emailAddress: state.emailAddress, password: state.password);
      }
      // se emite el nuevo valor de authFailureOrSuccess
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }, signInWithGooglePressed: (event) async* {
      //se emite el isSubmitting
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
      );
      // se realiza el logeo
      final failureOrSucces = await _authFacade.signInWithGoogle();
      // se emite el nuevo valor de authFailureOrSuccess
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: some(failureOrSucces),
      );
    }, resetPasswordWithEmail: (event) async* {
      Either<AuthFailure, Unit> failureOrSuccess;
      //en caso de que el email sea validos se emite el isSubmitting
      if (state.emailAddress.isValid()) {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );
        // se realiza el logeo
        failureOrSuccess = await _authFacade.resetPasswordWithEmail(
            emailAddress: state.emailAddress);
      }
      // se emite el nuevo valor de authFailureOrSuccess, y se establece el reset a true
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        reset: true,
        authFailureOrSuccess: optionOf(failureOrSuccess),
      );
    });
  }
}
