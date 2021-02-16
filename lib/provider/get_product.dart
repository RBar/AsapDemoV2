// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:asapdemo/core/errors/failures.dart';
import 'package:asapdemo/domain/entities/product_entity.dart';
import 'package:asapdemo/domain/repository/asapdemo_repository.dart';

@injectable
class GetProduct {
  final IAsapDemoRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, ProductEntity>> getProduct(int barcode) async {
    final response = await repository.getProduct(barcode);
    return response;
  }
}
