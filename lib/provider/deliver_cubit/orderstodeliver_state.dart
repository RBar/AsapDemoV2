part of 'orderstodeliver_cubit.dart';

// initial: estado inicial
// loading: cargando la informacion
// loaded: informacion cargada.
// error: error al cargar la info
@freezed
abstract class OrderstodeliverState with _$OrderstodeliverState {
  const factory OrderstodeliverState.initial() = _Initial;
  const factory OrderstodeliverState.loading() = _Loading;
  const factory OrderstodeliverState.loaded(
      {@required List<OrderListEntity> ordersList}) = _Loaded;
  const factory OrderstodeliverState.error() = _Error;
}
