// Flutter imports:
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        stops: [
          0,
          1,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromRGBO(23, 3, 66, 1), Color.fromRGBO(21, 0, 169, 1)],
      )),
    );
  }
}
