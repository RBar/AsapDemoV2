// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/domain/entities/order_entity.dart';
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/domain/entities/product_entity.dart';

abstract class IAsapDemoRepository {
  Future<Either<Failure, List<OrderListEntity>>> getOrdersToDeliverList();
  Future<Either<Failure, List<OrderListEntity>>> getDeliveredOrdersList();
  Future<Either<Failure, OrderEntity>> gerOrder(int orderId);
  Future<Either<Failure, ProductEntity>> getProduct(int barcode);
}
