import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/number_trivia/domain/entities/product.dart';
import 'package:ecommerce_app/features/number_trivia/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/number_trivia/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProduct(repository: mockProductRepository);
  });

  final tid = 1;

  final tProduct = Product(
      id: 1,
      name: 'name',
      description: 'description',
      imageUrl: 'imageUrl',
      price: 1);

  test('should get product details for the id from the repository', () async {
    // Arrange
    when(mockProductRepository.deleteProduct(any))
        .thenAnswer((_) async => Right(tProduct));

    //act
    final result = await usecase.execute(DeleteParams(id: tid));

    //arrange
    expect(result, Right(tProduct));
    verify(mockProductRepository.deleteProduct(tid));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
