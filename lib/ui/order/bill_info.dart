// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:asapdemo/provider/order_selected.dart';
import 'package:asapdemo/ui/order/manual_adjustment_button_info.dart';
import 'package:asapdemo/ui/order/manual_adjustment_form.dart';
import 'package:asapdemo/ui/order/spaced_between_row.dart';
import 'package:asapdemo/ui/order/total_cost_row.dart';
import 'package:asapdemo/ui/shared/custom_divider.dart';

class BillInfo extends StatefulWidget {
  const BillInfo({Key key}) : super(key: key);

  @override
  _BillInfoState createState() => _BillInfoState();
}

class _BillInfoState extends State<BillInfo> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _showManualAdjustment;
  @override
  void initState() {
    super.initState();
    _showManualAdjustment = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const Widget sizedBox = SizedBox(
      height: 15,
    );
    final order = context.watch<OrderSelected>();
    final delivered = order.selectedOrder.delivered;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        children: [
          const SpacedBetweenRow(
            firstText: "Subtotal",
            secondText: "\$7.99",
          ),
          sizedBox,
          const SpacedBetweenRow(
            firstText: "Packing charges",
            secondText: "\$7.99",
          ),
          const TotalCostRow(),
          const CustomDivider(),
          sizedBox,
          if (delivered) ...[
            const SpacedBetweenRow(
              firstText: "Created Time:",
              secondText: "24 Aug 2020, 1:50 PM",
            ),
            sizedBox,
            SpacedBetweenRow(
              firstText: "Delivered Time:",
              secondText: order.selectedOrder.deliveryTime,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          if (_showManualAdjustment) ...[
            ManualAdjustmentForm(
              formKey: _key,
            ),
            sizedBox,
          ],
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (!_showManualAdjustment) {
                setState(() {
                  _showManualAdjustment = true;
                });
              }
            },
            child: const ManualAdjustmentButtonInfo(),
          ),
        ],
      ),
    );
  }
}
