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
      // Emitimos el inicial para que se de el cambio de estado.
      yield const AuthState.initial();
      // Obtenemos el usuario logeado
      final userOption = await authFacade.getSignedUser();
      // Si tenemos un usuario emitimos autenticado en caso contratio unautenticado
      yield userOption.fold(() => const AuthState.unauthenticated(),
          (user) => AuthState.authenticated(user: user));
    }, signedOut: (event) async* {
      // Nos deslogeamos y emitimos unautenticado
      await authFacade.signOut();
      yield const AuthState.unauthenticated();
    });
  }
}
