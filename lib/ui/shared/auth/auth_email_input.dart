// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/shared/auth/auth_input.dart';

class AuthEmailInput extends StatelessWidget {
  const AuthEmailInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthInput(
        hintText: "Email/ mobile number",
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        textInputAction: TextInputAction.next,
        onChanged: (value) => context
            .read<SigninformBloc>()
            .add(SigninformEvent.emailChanged(value)),
        validator: (_) =>
            context.read<SigninformBloc>().state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (_) => null,
                ));
  }
}
