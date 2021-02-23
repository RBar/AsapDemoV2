// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:asapdemo/domain/entities/order_entity.dart';
import 'product_order_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel implements _$OrderModel {
  const factory OrderModel(
      {@required int orderId,
      @required List<ProductOrderModel> productList}) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  const OrderModel._();
  // transforma models to entities
  OrderEntity toDomain() => OrderEntity(
      orderId: orderId,
      productList: productList.map((product) => product.toDomain()).toList());
}

// Transforma de la informacion proveniente de firebase
class OrderModels {
  final List<OrderModel> items = [];
  OrderModels.fromJsonList(QuerySnapshot jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList.docs) {
      final activity = OrderModel.fromJson(item.data());
      items.add(activity);
    }
  }
}
