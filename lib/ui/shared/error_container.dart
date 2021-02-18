// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.2,
          child: SvgPicture.asset(
            'assets/images/error.svg',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
            child: Text(
          "Ups something went wrong",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        const Center(
            child: Text(
          "Check your connection",
          style: TextStyle(
            fontSize: 14,
          ),
        )),
        const SizedBox(
          height: 20,
        ),
        FlatButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (Route<dynamic> route) => false);
          },
          color: Colors.transparent,
          child: Column(
            children: const [
              Icon(
                FontAwesomeIcons.redoAlt,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Press to reload",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
