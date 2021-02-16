// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/home/order_button.dart';

class OrderListButtonsColumn extends StatelessWidget {
  final bool active;
  final bool orderscreen;
  const OrderListButtonsColumn({
    Key key,
    @required this.active,
    @required this.orderscreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          OrderButton(
            onPressed: () {},
            width: null,
            boxDeco: BoxDecoration(
                color: ColorPalette.lightBlue(),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ]),
            text: active ? "Accepted" : "Delivered",
            vpadding: 6,
            buttonPadding: EdgeInsets.zero,
          ),
          if (!orderscreen)
            OrderButton(
              onPressed: () {},
              width: null,
              boxDeco: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.white),
              ),
              text: "Paid",
              vpadding: 5,
              buttonPadding: null,
            ),
        ],
      ),
    );
  }
}
