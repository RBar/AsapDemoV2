// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';

part 'order_list_model.freezed.dart';
part 'order_list_model.g.dart';

@freezed
abstract class OrderListModel implements _$OrderListModel {
  @JsonSerializable(anyMap: true)
  const factory OrderListModel({
    @required String user,
    @required int ordersCount,
    @required int orderId,
    @required String address,
    @required String deliveryTime,
    @required bool delivered,
    @required @nullable String deliveredTime,
  }) = _OrderListModel;
  factory OrderListModel.fromJson(Map<String, dynamic> json) =>
      _$OrderListModelFromJson(json);
  const OrderListModel._();
  OrderListEntity toDomain() => OrderListEntity(
      user: user,
      address: address,
      deliveredTime: deliveredTime,
      orderId: orderId,
      deliveryTime: deliveryTime,
      delivered: delivered,
      ordersCount: ordersCount);
}

class OrderListModels {
  final List<OrderListModel> items = [];
  OrderListModels.fromJsonList(QuerySnapshot jsonList) {
    if (jsonList == null) return;
    for (final item in jsonList.docs) {
      final activity = OrderListModel.fromJson(item.data());

      items.add(activity);
    }
  }
}
