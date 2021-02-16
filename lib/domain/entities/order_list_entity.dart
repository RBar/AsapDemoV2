// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_list_entity.freezed.dart';

@freezed
abstract class OrderListEntity with _$OrderListEntity {
  const factory OrderListEntity({
    @required String user,
    @required int ordersCount,
    @required int orderId,
    @required String address,
    @required String deliveryTime,
    @required @nullable String deliveredTime,
    @required bool delivered,
  }) = _OrderListEntity;
}
