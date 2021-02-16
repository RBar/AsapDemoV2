// Flutter imports:
import 'package:flutter/material.dart';

class ConstrainedWidget extends StatelessWidget {
  final double minHeight;
  final List<Widget> widgetList;

  const ConstrainedWidget({
    Key key,
    @required this.minHeight,
    @required this.widgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetList,
        ),
      ),
    );
  }
}
