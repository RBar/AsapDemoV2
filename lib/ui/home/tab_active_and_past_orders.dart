// Flutter imports:
import 'package:asapdemo/ui/shared/error_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/provider/deliver_cubit/orderstodeliver_cubit.dart';
import 'package:asapdemo/provider/delivered_cubit/delivered_order_cubit.dart';
import 'package:asapdemo/ui/home/no_orders_image.dart';
import 'package:asapdemo/ui/home/order_list_widget.dart';
import 'package:asapdemo/ui/screens/order.dart';
import 'package:asapdemo/ui/shared/loading_widget.dart';
import 'package:asapdemo/ui/shared/multibloc_widget.dart';

class ActiveAndPastOrdersWidget extends StatelessWidget {
  final bool active;
  const ActiveAndPastOrdersWidget({Key key, @required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget blocWidget = active
        ? BlocBuilder<OrderstodeliverCubit, OrderstodeliverState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<OrderstodeliverCubit>().getOrdersToDeliver();
                  return Container(color: Colors.transparent);
                },
                loaded: (state) {
                  if (state.ordersList.isEmpty) {
                    return const NoOrdersImage();
                  } else {
                    return _ListViewBloc(
                      itemCount: state.ordersList.length,
                      active: active,
                      orderList: state.ordersList,
                    );
                  }
                },
                loading: (_) => const LoadingWidget()))
        : BlocBuilder<DeliveredOrdersCubit, DeliveredOrderState>(
            builder: (context, state) => state.map(
                error: (_) => const ErrorContainer(),
                initial: (value) {
                  context.read<DeliveredOrdersCubit>().getDeliveredOrders();
                  return Container(color: Colors.transparent);
                },
                loaded: (state) {
                  if (state.ordersList.isEmpty) {
                    return const NoOrdersImage();
                  } else {
                    return _ListViewBloc(
                      itemCount: state.ordersList.length,
                      active: active,
                      orderList: state.ordersList,
                    );
                  }
                },
                loading: (_) => const LoadingWidget()));
    return MultiBlocWidget(
      child: blocWidget,
    );
  }
}

class _ListViewBloc extends StatefulWidget {
  final bool active;
  final int itemCount;
  final List<OrderListEntity> orderList;

  const _ListViewBloc(
      {Key key,
      @required this.orderList,
      @required this.active,
      @required this.itemCount})
      : super(key: key);

  @override
  __ListViewBlocState createState() => __ListViewBlocState();
}

class __ListViewBlocState extends State<_ListViewBloc> {
  GlobalKey<RefreshIndicatorState> _refreshKey;
  @override
  void initState() {
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _onRefresh() async {
      if (widget.active) {
        context.read<OrderstodeliverCubit>().getOrdersToDeliver();
      } else {
        context.read<DeliveredOrdersCubit>().getDeliveredOrders();
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }

    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/order',
                    arguments: OrderScreenArguments(
                        delivered: !widget.active,
                        index: index,
                        orderId: widget.orderList[index].orderId));
              },
              child: OrderListWidget(
                height: 150,
                index: index,
                active: widget.active,
                orderscreen: false,
              ));
        },
      ),
    );
  }
}
