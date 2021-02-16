// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/auth/application/sign_in_bloc/signinform_bloc.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 30,
        onPressed: () {
          context
              .read<SigninformBloc>()
              .add(const SigninformEvent.signInWithGooglePressed());
        },
        child: Container(
          width: size.width * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: const [
              SizedBox(
                height: 25,
                width: 25,
                child: Image(
                  image: AssetImage(
                    'assets/images/google.svg.webp',
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Google",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff696969),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
