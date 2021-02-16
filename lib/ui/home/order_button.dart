// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final double vpadding;
  final EdgeInsetsGeometry buttonPadding;
  final BoxDecoration boxDeco;
  final String text;
  final double width;
  final Function() onPressed;
  const OrderButton({
    Key key,
    @required this.vpadding,
    @required this.buttonPadding,
    @required this.boxDeco,
    @required this.text,
    @required this.width,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: buttonPadding,
      onPressed: () {},
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: vpadding),
        decoration: boxDeco,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
