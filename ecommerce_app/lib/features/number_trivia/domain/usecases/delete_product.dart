import 'package:dartz/dartz.dart';
import 'detail_product.dart';
import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct({required this.repository});
  Future<Either<Failure, Product>> execute(DeleteParams params) async {
    return await repository.detailProduct(params.id);
  }
}

class DeleteParams {
  final int id;

  DeleteParams({required this.id});
}
