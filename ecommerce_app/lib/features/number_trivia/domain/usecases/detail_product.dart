import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class DetailProduct implements Usecase<Product, DetailParams> {
  final ProductRepository repository;

  DetailProduct({required this.repository});
  Future<Either<Failure, Product>> call(DetailParams params) async {
    return await repository.detailProduct(params.id);
  }
}

class DetailParams {
  final int id;

  DetailParams({required this.id});
}
