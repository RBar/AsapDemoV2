// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:

import 'package:asapdemo/ui/landing/lading_column.dart';
import 'package:asapdemo/ui/shared/auth/auth_background.dart';
import 'package:asapdemo/ui/template/login_signup/bloc_auth_errors_consumer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BlocAuthErrorsConsumer(
      child: AuthBackgroundWidget(
        child: LandingColumn(),
      ),
    );
  }
}
