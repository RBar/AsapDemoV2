// Flutter imports:
import 'package:asapdemo/ui/shared/error_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/domain/entities/product_entity.dart';
import 'package:asapdemo/injection.dart';
import 'package:asapdemo/provider/get_product.dart';
import 'package:asapdemo/ui/order/product_name_and_cost_row.dart';
import 'package:asapdemo/ui/shared/constrained_widget.dart';
import 'package:asapdemo/ui/shared/custom_divider.dart';

class ProductWidget extends StatelessWidget {
  final int barCode;
  final int quantity;
  const ProductWidget({
    Key key,
    @required this.barCode,
    @required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = getIt<GetProduct>();
    return FutureBuilder<Either<Failure, ProductEntity>>(
        future: provider.getProduct(barCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.fold(
                (l) => const ErrorContainer(),
                (product) => ConstrainedWidget(
                      minHeight: 100,
                      widgetList: [
                        ProductNameAndCost(
                          name: product.name,
                          price: product.price,
                          quantity: quantity,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("codigo de barras $barCode",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14)),
                        const SizedBox(height: 10),
                        const CustomDivider()
                      ],
                    ));
          }
          return Container(color: Colors.transparent);
        });
  }
}
