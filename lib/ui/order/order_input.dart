// Flutter imports:
import 'package:flutter/material.dart';

class OrderInput extends StatelessWidget {
  final double radius;
  final int maxlines;
  final TextInputAction textInputAction;
  final void Function(String) onChanged;
  final String hintext;
  const OrderInput({
    Key key,
    @required this.radius,
    @required this.maxlines,
    @required this.textInputAction,
    @required this.onChanged,
    @required this.hintext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: TextFormField(
        cursorColor: Colors.white,
        maxLines: maxlines,
        autocorrect: false,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.light,
        textInputAction: textInputAction,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
            labelStyle: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            enabledBorder: _outlineBorder(),
            isDense: true,
            suffixStyle: const TextStyle(color: Colors.red),
            hintText: hintext,
            focusedBorder: _outlineBorder(),
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            border: _outlineBorder()),
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
