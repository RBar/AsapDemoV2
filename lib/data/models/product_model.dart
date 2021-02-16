// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:asapdemo/domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel implements _$ProductModel {
  const factory ProductModel({
    @required String name,
    @required int barCode,
    @required double price,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  const ProductModel._();
  ProductEntity toDomain() =>
      ProductEntity(barCode: barCode, name: name, price: price);
}

class ProductModels {
  final List<ProductModel> items = [];
  ProductModels.fromJsonList(QuerySnapshot jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList.docs) {
      final activity = ProductModel.fromJson(item.data());
      items.add(activity);
    }
  }
}
