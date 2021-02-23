// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:asapdemo/core/errors/exceptions.dart';
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/core/network/network_info.dart';
import 'package:asapdemo/data/models/order_list_model.dart';
import 'package:asapdemo/data/models/order_model.dart';
import 'package:asapdemo/data/models/product_model.dart';
import 'package:asapdemo/domain/entities/order_entity.dart';
import 'package:asapdemo/domain/entities/order_list_entity.dart';
import 'package:asapdemo/domain/entities/product_entity.dart';
import 'package:asapdemo/domain/repository/asapdemo_repository.dart';

@LazySingleton(as: IAsapDemoRepository)
class AsapDemoRepositoryImpl implements IAsapDemoRepository {
  final NetworkInfo networkInfo; // internet checker
  final FirebaseFirestore firestore;

  AsapDemoRepositoryImpl(this.networkInfo, this.firestore);
  @override
  Future<Either<Failure, OrderEntity>> gerOrder(int orderId) async {
    if (await networkInfo.isConnected) {
      try {
        final resp = await firestore
            .collection("orders")
            .where('orderId', isEqualTo: orderId)
            .get();

        if (resp.docs == null || resp.docs.isEmpty) {
          return left(const Failure.unexpectedFailure());
        }
        // se transforma la informacion de firebase a una lista de modelos
        final product = OrderModels.fromJsonList(resp);
        // se retorna solo el primer modelo, conviertiendolo a domain
        return right(product.items
            .map((productModel) => productModel.toDomain())
            .toList()[0]);
      } on ServerException catch (_) {
        return left(const Failure.serverFailure());
      } on UnexpectedException catch (_) {
        return left(const Failure.unexpectedFailure());
      } catch (e) {
        return left(const Failure.connectionFailure());
      }
    } else {
      return left(const Failure.connectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderListEntity>>>
      getDeliveredOrdersList() async {
    if (await networkInfo.isConnected) {
      try {
        final resp = await firestore
            .collection("order_list")
            .where('delivered', isEqualTo: true)
            .get();

        if (resp.docs == null || resp.docs.isEmpty) {
          final List<OrderListEntity> emptyList = [];
          return right(emptyList);
        }

        final orders = OrderListModels.fromJsonList(resp);

        return right(orders.items
            .map((orderListModel) => orderListModel.toDomain())
            .toList());
      } on ServerException catch (_) {
        return left(const Failure.serverFailure());
      } on UnexpectedException catch (_) {
        return left(const Failure.unexpectedFailure());
      } catch (e) {
        return left(const Failure.connectionFailure());
      }
    } else {
      return left(const Failure.connectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderListEntity>>>
      getOrdersToDeliverList() async {
    if (await networkInfo.isConnected) {
      try {
        final resp = await firestore
            .collection("order_list")
            .where('delivered', isEqualTo: false)
            .get();

        if (resp.docs == null || resp.docs.isEmpty) {
          final List<OrderListEntity> emptyList = [];
          return right(emptyList);
        }

        final orders = OrderListModels.fromJsonList(resp);

        return right(
            orders.items.map((orderModel) => orderModel.toDomain()).toList());
      } on ServerException catch (_) {
        return left(const Failure.serverFailure());
      } on UnexpectedException catch (_) {
        return left(const Failure.unexpectedFailure());
      } catch (e) {
        return left(const Failure.connectionFailure());
      }
    } else {
      return left(const Failure.connectionFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(int barcode) async {
    if (await networkInfo.isConnected) {
      try {
        final resp = await firestore
            .collection("products")
            .where('barCode', isEqualTo: barcode)
            .get();

        if (resp.docs == null || resp.docs.isEmpty) {
          return left(const Failure.unexpectedFailure());
        }

        final product = ProductModels.fromJsonList(resp);

        return right(product.items
            .map((productModel) => productModel.toDomain())
            .toList()[0]);
      } on ServerException catch (_) {
        return left(const Failure.serverFailure());
      } on UnexpectedException catch (_) {
        return left(const Failure.unexpectedFailure());
      } catch (e) {
        return left(const Failure.connectionFailure());
      }
    } else {
      return left(const Failure.connectionFailure());
    }
  }
}
