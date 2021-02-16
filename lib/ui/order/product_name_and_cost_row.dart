// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class ProductNameAndCost extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  const ProductNameAndCost(
      {Key key,
      @required this.name,
      @required this.price,
      @required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            "${quantity}x $name",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "\$$price",
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
