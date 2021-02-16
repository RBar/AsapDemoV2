// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:asapdemo/provider/deliver_cubit/orderstodeliver_cubit.dart';
import 'package:asapdemo/provider/delivered_cubit/delivered_order_cubit.dart';
import '../../injection.dart';

class MultiBlocWidget extends StatelessWidget {
  final Widget child;
  const MultiBlocWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<OrderstodeliverCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DeliveredOrdersCubit>(),
        ),
      ],
      child: Container(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
