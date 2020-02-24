import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/repositories/get_concrete_number_trivia.dart';
import 'package:tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class MockNumberTriviaRepository extends Mock
  implements NumberTriviaRepository {

}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = new GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(
    number: tNumber,
    text: 'text'
  );

  test(
    'should get trivia for the number from the repository',
    () async {
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase.execute(number: tNumber);

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}

getConcreteNumberTrivia(any) {
}