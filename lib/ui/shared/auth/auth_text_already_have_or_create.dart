// Flutter imports:
import 'package:flutter/material.dart';

class AlreadyHaveOrCreateAccountTextWidget extends StatelessWidget {
  final String route;
  final String normalText;
  final String boldText;

  const AlreadyHaveOrCreateAccountTextWidget({
    Key key,
    @required this.route,
    @required this.normalText,
    @required this.boldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            children: [
              TextSpan(text: normalText),
              TextSpan(
                  text: boldText,
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
