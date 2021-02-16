// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

// Project imports:
import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade authFacade;

  AuthBloc(this.authFacade) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(authCheckRequested: (event) async* {
      final userOption = await authFacade.getSignedUser();
      yield userOption.fold(() => const AuthState.unauthenticated(),
          (user) => AuthState.authenticated(user: user));
    }, signedOut: (event) async* {
      await authFacade.signOut();
      yield const AuthState.unauthenticated();
    });
  }
}
