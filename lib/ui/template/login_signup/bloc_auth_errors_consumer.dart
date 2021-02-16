// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/shared/auth/error_flushbar.dart';

class BlocAuthErrorsConsumer extends StatelessWidget {
  final Widget child;

  const BlocAuthErrorsConsumer({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninformBloc, SigninformState>(
        listener: (context, state) {
      state.authFailureOrSuccess.fold(
        () {},
        (either) => either.fold(
          (failure) {
            failure.map(
              canceledByUser: (_) =>
                  showErrorFlushbar('Login with google cancelled', context),
              serverError: (_) => showErrorFlushbar('Server Error', context),
              emailAlreadyInUse: (_) =>
                  showErrorFlushbar('Email Already in use', context),
              invalidEmailandPasswordCombination: (_) => showErrorFlushbar(
                  'Invalid email and password combination', context),
            );
          },
          (_) {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
      );
    }, builder: (context, state) {
      return child;
    });
  }
}
