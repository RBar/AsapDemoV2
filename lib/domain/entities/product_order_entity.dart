// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_order_entity.freezed.dart';

@freezed
abstract class ProductOrderEntity with _$ProductOrderEntity {
  const factory ProductOrderEntity({
    @required int quantity,
    @required int barCode,
  }) = _ProductOrderEntity;
}
