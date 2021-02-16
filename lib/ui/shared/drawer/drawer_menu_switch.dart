// Flutter imports:
import 'package:flutter/material.dart';

class MenuSwitch extends StatefulWidget {
  const MenuSwitch({Key key}) : super(key: key);

  @override
  _MenuSwitchState createState() => _MenuSwitchState();
}

class _MenuSwitchState extends State<MenuSwitch> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: const Color.fromRGBO(43, 202, 89, 1),
      activeColor: Colors.white,
    );
  }
}
