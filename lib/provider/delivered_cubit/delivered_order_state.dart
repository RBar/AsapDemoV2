part of 'delivered_order_cubit.dart';

// initial: estado inicial
// loading: cargando la informacion
// loaded: informacion cargada.
// error: error al cargar la info

@freezed
abstract class DeliveredOrderState with _$DeliveredOrderState {
  const factory DeliveredOrderState.initial() = _Initial;
  const factory DeliveredOrderState.loading() = _Loading;
  const factory DeliveredOrderState.loaded(
      {@required List<OrderListEntity> ordersList}) = _Loaded;
  const factory DeliveredOrderState.error() = _Error;
}
