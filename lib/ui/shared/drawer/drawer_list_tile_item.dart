// Flutter imports:
import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ListTileItem({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
      ),
    );
  }
}
