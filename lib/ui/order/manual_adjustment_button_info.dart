// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';

class ManualAdjustmentButtonInfo extends StatelessWidget {
  const ManualAdjustmentButtonInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ColorPalette.lightBlue(),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
          ]),
      child: const Center(
        child: Text(
          "Manual Adjustment",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
