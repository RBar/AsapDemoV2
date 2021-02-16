// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/shared/auth/app_bar.dart';
import 'package:asapdemo/ui/shared/auth/auth_background.dart';
import 'package:asapdemo/ui/template/login_signup/bloc_auth_errors_consumer.dart';
import 'package:asapdemo/ui/template/login_signup/login_signup_column.dart';

class LoginSignupTemplate extends StatelessWidget {
  final String loginOrSignup;

  const LoginSignupTemplate({
    Key key,
    @required this.loginOrSignup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocAuthErrorsConsumer(
        child: AuthBackgroundWidget(
      child: Stack(
        children: [
          const CustomAppBar(),
          SizedBox(
              width: size.width,
              height: size.height,
              child: loginOrSignup == "Login"
                  ? _loginTemplate(context)
                  : _signUpTemplate(context)),
        ],
      ),
    ));
  }

  Widget _loginTemplate(BuildContext context) {
    return LoginSignupColumnWidget(
      buttonName: "Login",
      normalText: "Don't you have an account?",
      pageText: "Log In",
      route: '/signup',
      boldText: "Sign Up",
      onPressed: () => context.read<SigninformBloc>().add(
            const SigninformEvent.signInWithEmailAndPasswordPressed(),
          ),
    );
  }

  Widget _signUpTemplate(BuildContext context) {
    return LoginSignupColumnWidget(
      buttonName: "Signup",
      normalText: "Already have an account?",
      pageText: "Sign Up",
      route: '/login',
      boldText: "Log In",
      onPressed: () => context.read<SigninformBloc>().add(
            const SigninformEvent.registerWithEmailAndPasswordPressed(),
          ),
    );
  }
}
