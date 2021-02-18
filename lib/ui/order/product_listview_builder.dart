// Flutter imports:
import 'package:asapdemo/ui/shared/error_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/domain/entities/order_entity.dart';
import 'package:asapdemo/injection.dart';
import 'package:asapdemo/provider/get_order.dart';
import 'package:asapdemo/provider/order_selected.dart';
import 'package:asapdemo/ui/order/bill_info.dart';
import 'package:asapdemo/ui/order/product_shimmer.dart';
import 'package:asapdemo/ui/order/product_widget.dart';

class ProductListviewBuilder extends StatelessWidget {
  const ProductListviewBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = getIt<GetOrder>();
    final order = context.watch<OrderSelected>();
    return FutureBuilder<Either<Failure, OrderEntity>>(
        future: provider.getOrder(order.selectedOrder.orderId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.fold((l) => const ErrorContainer(), (order) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: order.productList.length + 1,
                itemBuilder: (context, index) {
                  if (index <= order.productList.length - 1) {
                    return ProductWidget(
                      barCode: order.productList[index].barCode,
                      quantity: order.productList[index].quantity,
                    );
                  } else {
                    return const BillInfo();
                  }
                },
              );
            });
          }
          return const ProductShimmer();
        });
  }
}
