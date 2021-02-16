// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/domain/repository/asapdemo_repository.dart';

part 'orderstodeliver_state.dart';
part 'orderstodeliver_cubit.freezed.dart';

@injectable
class OrderstodeliverCubit extends Cubit<OrderstodeliverState> {
  final IAsapDemoRepository _asapDemoRepository;
  OrderstodeliverCubit(this._asapDemoRepository)
      : super(const OrderstodeliverState.initial());

  Future<void> getOrdersToDeliver() async {
    emit(const OrderstodeliverState.loading());
    final failureOrSucces = await _asapDemoRepository.getOrdersToDeliverList();
    emit(failureOrSucces.fold(
      (l) => const OrderstodeliverState.error(),
      (orders) => OrderstodeliverState.loaded(ordersList: orders),
    ));
  }
}
