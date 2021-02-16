// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/home/order_info_column.dart';
import 'package:asapdemo/ui/home/order_list_button_column.dart';
import 'package:asapdemo/ui/shared/constrained_widget.dart';
import 'package:asapdemo/ui/shared/custom_divider.dart';

class OrderListWidget extends StatelessWidget {
  final bool active;
  final bool orderscreen;
  final int index;
  final double height;
  const OrderListWidget({
    Key key,
    @required this.active,
    @required this.orderscreen,
    @required this.index,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Widget> _orderListWidget = [
      SizedBox(height: 10),
      CustomDivider()
    ];
    return ConstrainedWidget(
      minHeight: height,
      widgetList: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderInfoColumn(
              index: index,
              active: active,
              orderscreen: orderscreen,
            ),
            OrderListButtonsColumn(
              active: active,
              orderscreen: orderscreen,
            )
          ],
        ),
        if (!orderscreen) ..._orderListWidget
      ],
    );
  }
}
