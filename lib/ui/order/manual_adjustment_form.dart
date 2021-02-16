// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/order/order_input.dart';

class ManualAdjustmentForm extends StatelessWidget {
  final Key formKey;

  const ManualAdjustmentForm({Key key, @required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Adjust Amount"),
          ),
          const SizedBox(
            height: 15,
          ),
          OrderInput(
            hintext: "Amount",
            maxlines: 1,
            onChanged: (value) {},
            radius: 30,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Reason"),
          ),
          const SizedBox(
            height: 15,
          ),
          OrderInput(
            hintext: "Leave Comment",
            maxlines: 3,
            onChanged: (value) {},
            radius: 15,
            textInputAction: TextInputAction.send,
          ),
        ],
      ),
    );
  }
}
