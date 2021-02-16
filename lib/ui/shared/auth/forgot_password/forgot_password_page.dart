// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/ui/helpers/color_palette.dart';
import '../../../../injection.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorPalette.baseBlue(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalette.baseBlue(),
          leading: IconButton(
              icon: const Icon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: BlocProvider(
          create: (context) => getIt<SigninformBloc>(),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              width: size.width,
              height: size.height,
              child: SafeArea(child: ForgotPasswordForm())),
        ),
      ),
    );
  }
}
