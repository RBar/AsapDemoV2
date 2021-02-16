// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/shared/background_container.dart';

class AuthBackgroundWidget extends StatelessWidget {
  final Widget child;

  const AuthBackgroundWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            const BackgroundContainer(),
            SafeArea(
              child: Center(child: child),
            )
          ])),
    );
  }
}
