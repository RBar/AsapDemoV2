// Flutter imports:
import 'package:flutter/material.dart';

class SpacedBetweenRow extends StatelessWidget {
  final String firstText;
  final String secondText;

  const SpacedBetweenRow(
      {Key key, @required this.firstText, @required this.secondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(firstText), Text(secondText)],
    );
  }
}
