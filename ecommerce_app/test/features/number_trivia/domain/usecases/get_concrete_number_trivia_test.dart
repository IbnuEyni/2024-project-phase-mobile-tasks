import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:ecommerce_app/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import 'package:ecommerce_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class
class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepositories {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'should get trivia for the number from repository',
    () async {
      // Arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
          .thenAnswer((_) async => Right(tNumberTrivia));

      // Act
      final result = await usecase.execute(Params(number: tNumber));

      // Assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
