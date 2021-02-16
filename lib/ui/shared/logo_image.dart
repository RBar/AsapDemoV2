// Flutter imports:
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Image.asset(
      'assets/images/logo.png',
      height: size.height * 0.05,
    );
  }
}
