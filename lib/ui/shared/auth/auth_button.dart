// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final String text;
  final Function() onPressed;
  const AuthButton({
    Key key,
    @required this.boxDecoration,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 30,
        onPressed: onPressed,
        child: Container(
          width: size.width * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: boxDecoration,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
