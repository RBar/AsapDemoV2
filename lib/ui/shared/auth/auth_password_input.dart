// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/shared/auth/auth_input.dart';

class AuthPasswordInput extends StatelessWidget {
  const AuthPasswordInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthInput(
        hintText: "Password",
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.send,
        onChanged: (value) => context
            .read<SigninformBloc>()
            .add(SigninformEvent.passwordChanged(value)),
        validator: (_) =>
            context.read<SigninformBloc>().state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password',
                    orElse: () => null,
                  ),
                  (_) => null,
                ));
  }
}
