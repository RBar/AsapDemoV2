// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/auth_bloc/auth_bloc.dart';
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';
import 'package:asapdemo/core/widgets/firebase_initializer.dart';
import 'package:asapdemo/injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      ),
      BlocProvider(
        create: (context) => getIt<SigninformBloc>(),
      )
    ], child: const FirebaseChecker());
  }
}
