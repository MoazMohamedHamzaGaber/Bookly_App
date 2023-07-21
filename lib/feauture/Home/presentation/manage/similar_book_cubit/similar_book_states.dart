abstract class SimilarBooksStates{}

class InitialSimilarBooksStates extends SimilarBooksStates{}

class LoadingSimilarBooksStates extends SimilarBooksStates{}

class SuccessSimilarBooksStates extends SimilarBooksStates{}

class ErrorSimilarBooksStates extends SimilarBooksStates{
  final String error;

  ErrorSimilarBooksStates(this.error);
}