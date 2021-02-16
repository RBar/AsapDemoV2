// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:asapdemo/domain/entities/product_order_entity.dart';

part 'product_order_model.freezed.dart';
part 'product_order_model.g.dart';

@freezed
abstract class ProductOrderModel implements _$ProductOrderModel {
  const factory ProductOrderModel({
    @required int quantity,
    @required int barCode,
  }) = _ProductOrderModel;
  factory ProductOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderModelFromJson(json);
  const ProductOrderModel._();
  ProductOrderEntity toDomain() =>
      ProductOrderEntity(barCode: barCode, quantity: quantity);
}

class ProductOrderModels {
  final List<ProductOrderModel> items = [];
  ProductOrderModels.fromJsonList(QuerySnapshot jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList.docs) {
      final activity = ProductOrderModel.fromJson(item.data());
      items.add(activity);
    }
  }
}
