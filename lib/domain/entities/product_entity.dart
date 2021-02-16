// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @required String name,
    @required int barCode,
    @required double price,
  }) = _ProductEntity;
}
