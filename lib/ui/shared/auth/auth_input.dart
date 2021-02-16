// Flutter imports:
import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final void Function(String) onChanged;
  final String Function(String) validator;

  const AuthInput({
    Key key,
    @required this.obscureText,
    @required this.keyboardType,
    @required this.textInputAction,
    @required this.hintText,
    @required this.onChanged,
    @required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      textInputAction: textInputAction,
      textAlign: TextAlign.justify,
      obscureText: obscureText,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          focusColor: Colors.white,
          suffixStyle: const TextStyle(color: Colors.red),
          labelStyle:
              Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
          enabledBorder: _border(),
          border: _border(),
          focusedBorder: _border(),
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.white)),
      onChanged: onChanged,
      validator: validator,
    );
  }

  UnderlineInputBorder _border() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(
      color: Colors.white,
    ));
  }
}
