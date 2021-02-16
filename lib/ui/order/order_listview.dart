// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/provider/deliver_cubit/orderstodeliver_cubit.dart';
import 'package:asapdemo/provider/delivered_cubit/delivered_order_cubit.dart';
import 'package:asapdemo/provider/order_selected.dart';
import 'package:asapdemo/ui/home/order_list_widget.dart';
import 'package:asapdemo/ui/order/delivery_time_container.dart';
import 'package:asapdemo/ui/order/product_listview_builder.dart';
import 'package:asapdemo/ui/shared/drawer/error_container.dart';
import 'package:asapdemo/ui/shared/loading_widget.dart';
import 'package:asapdemo/ui/shared/multibloc_widget.dart';

class OrderScreenListView extends StatelessWidget {
  final bool delivered;
  final int index;
  const OrderScreenListView({
    Key key,
    @required this.delivered,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget blocWidget = !delivered
        ? BlocBuilder<OrderstodeliverCubit, OrderstodeliverState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<OrderstodeliverCubit>().getOrdersToDeliver();
                  return Container(color: Colors.transparent);
                },
                loaded: (state) => Provider(
                      create: (context) =>
                          OrderSelected(state.ordersList[index]),
                      child: _ListViewBloc(
                        order: state.ordersList[index],
                        index: index,
                        delivered: delivered,
                      ),
                    ),
                loading: (_) => const LoadingWidget()))
        : BlocBuilder<DeliveredOrdersCubit, DeliveredOrderState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<DeliveredOrdersCubit>().getDeliveredOrders();
                  return Container(color: Colors.transparent);
                },
                loaded: (state) => Provider(
                      create: (context) =>
                          OrderSelected(state.ordersList[index]),
                      child: _ListViewBloc(
                        order: state.ordersList[index],
                        index: index,
                        delivered: delivered,
                      ),
                    ),
                loading: (_) => const LoadingWidget()));
    return MultiBlocWidget(
      child: blocWidget,
    );
  }
}

class _ListViewBloc extends StatelessWidget {
  final bool delivered;
  final int index;
  final OrderListEntity order;
  const _ListViewBloc({
    Key key,
    @required this.delivered,
    @required this.index,
    @required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 20,
        ),
        OrderListWidget(
          height: 90,
          active: !delivered,
          index: index,
          orderscreen: true,
        ),
        if (!delivered)
          DeliveryTimeContainer(
            deliveryTime: order.deliveryTime,
          ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: _getTabHeight(size.height),
          child: const ProductListviewBuilder(),
        )
      ],
    );
  }

  double _getTabHeight(double deviceHeight) {
    if (deviceHeight >= 1200) {
      return deviceHeight * 0.75;
    } else if (deviceHeight <= 600) {
      return deviceHeight * 0.54;
    } else {
      return deviceHeight * 0.6;
    }
  }
}
