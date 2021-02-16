// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/shared/auth/auth_button.dart';
import 'package:asapdemo/ui/shared/auth/auth_email_input.dart';
import 'package:asapdemo/ui/shared/auth/error_flushbar.dart';
import 'package:asapdemo/ui/shared/auth/forgot_password/reset_password_flushbar.dart';
import 'package:asapdemo/ui/shared/logo_image.dart';

class ForgotPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninformBloc, SigninformState>(
      listener: (context, state) {
        if (state.reset) {
          showResetPasswordFlushbar(
              'A password reset link has been sent to ${state.emailAddress.value.fold((_) => '', (email) => email)}',
              context);
        }
        state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              failure.map(
                canceledByUser: (_) => null,
                serverError: (_) => showErrorFlushbar('Server Error', context),
                emailAlreadyInUse: (_) => null,
                invalidEmailandPasswordCombination: (_) => null,
              );
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.copyWith(
                    subtitle1: Theme.of(context).textTheme.bodyText1.apply(
                        color: const Color(0xff17334F),
                        decoration: TextDecoration.none),
                  )),
          child: Form(
            autovalidate: state.showErrorMessages,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                const SizedBox(height: 50),
                const LogoImage(),
                const SizedBox(height: 50),
                const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("Insert your information"),
                const SizedBox(height: 20),
                const AuthEmailInput(),
                const SizedBox(height: 30),
                AuthButton(
                  boxDecoration: BoxDecoration(
                      color: ColorPalette.lightBlue(),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 5)
                      ]),
                  text: "Reset Password",
                  onPressed: () {
                    context.read<SigninformBloc>().add(
                          const SigninformEvent.resetPasswordWithEmail(),
                        );
                  },
                ),
                const SizedBox(height: 80),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
