// Flutter imports:
import 'package:flutter/material.dart';

class NoOrdersImage extends StatelessWidget {
  const NoOrdersImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
          child: Image.asset(
        "assets/images/orders_image.png",
        height: size.height * 0.4,
      )),
    );
  }
}
