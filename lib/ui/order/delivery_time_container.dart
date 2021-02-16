// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';

class DeliveryTimeContainer extends StatelessWidget {
  final String deliveryTime;
  const DeliveryTimeContainer({Key key, @required this.deliveryTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: ColorPalette.lightPurple(),
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("Delivery time: $deliveryTime"),
        const Icon(
          FontAwesomeIcons.pencilAlt,
          size: 13,
        )
      ]),
    );
  }
}
