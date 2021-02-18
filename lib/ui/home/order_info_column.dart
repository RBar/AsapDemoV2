// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/provider/deliver_cubit/orderstodeliver_cubit.dart';
import 'package:asapdemo/provider/delivered_cubit/delivered_order_cubit.dart';
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/shared/error_container.dart';
import 'package:asapdemo/ui/shared/multibloc_widget.dart';

class OrderInfoColumn extends StatelessWidget {
  final int index;
  final bool active;
  final bool orderscreen;
  const OrderInfoColumn({
    Key key,
    @required this.index,
    @required this.active,
    @required this.orderscreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget blocWidget = active
        ? BlocBuilder<OrderstodeliverCubit, OrderstodeliverState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<OrderstodeliverCubit>().getOrdersToDeliver();
                  return const ShimmerPlaceholder();
                },
                loaded: (state) => _OrderInfo(
                      order: state.ordersList[index],
                      active: active,
                      orderscreen: orderscreen,
                    ),
                loading: (_) => const ShimmerPlaceholder()))
        : BlocBuilder<DeliveredOrdersCubit, DeliveredOrderState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<DeliveredOrdersCubit>().getDeliveredOrders();
                  return const ShimmerPlaceholder();
                },
                loaded: (state) => _OrderInfo(
                      order: state.ordersList[index],
                      active: active,
                      orderscreen: orderscreen,
                    ),
                loading: (_) => const ShimmerPlaceholder()));

    return Expanded(
      flex: 3,
      child: MultiBlocWidget(
        child: blocWidget,
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _greyContainer = Container(
      height: 10,
      width: 200,
      decoration: BoxDecoration(
          color: ColorPalette.greyContainer(),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
    const _sizedbox = SizedBox(
      height: 5,
    );
    final wList = [_greyContainer, _sizedbox];
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: ColorPalette.shimmerBaseColor(),
      child: Column(
        children: [...wList, ...wList, ...wList, ...wList, ...wList],
      ),
    );
  }
}

class _OrderInfo extends StatelessWidget {
  final OrderListEntity order;
  final bool active;
  final bool orderscreen;
  const _OrderInfo({
    Key key,
    @required this.order,
    @required this.active,
    @required this.orderscreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget deliveryOrDelivered = active
        ? Text(
            "Delivery Time: ${order.deliveryTime}",
          )
        : Text(
            // ignore: unnecessary_string_interpolations
            "${order?.deliveredTime}",
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.user,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "${order.ordersCount} orders with you",
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Text("Order ID: ${order.orderId}"),
        const SizedBox(height: 5),
        Text(
          "Address: ${order.address}",
        ),
        const SizedBox(height: 5),
        if (!orderscreen) deliveryOrDelivered
      ],
    );
  }
}
