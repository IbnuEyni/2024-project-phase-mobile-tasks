import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repositories.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepositories repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params {
  final int number;

  Params({required this.number});
}
