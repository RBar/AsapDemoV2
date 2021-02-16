// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/domain/entities/order_entity.dart';
import 'package:asapdemo/domain/repository/asapdemo_repository.dart';

@injectable
class GetOrder {
  final IAsapDemoRepository repository;

  GetOrder(this.repository);

  Future<Either<Failure, OrderEntity>> getOrder(int barcode) async {
    final response = await repository.gerOrder(barcode);

    return response;
  }
}
