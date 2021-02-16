// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalCostRow extends StatelessWidget {
  const TotalCostRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Total Cost"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
              minSize: 0,
              onPressed: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    "Paid",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            const Text("\$7.99")
          ],
        )
      ],
    );
  }
}
