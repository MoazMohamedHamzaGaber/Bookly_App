abstract class SearchBooksStates{}

class InitialSearchBooksStates extends SearchBooksStates{}

class LoadingSearchBooksStates extends SearchBooksStates{}

class SuccessSearchBooksStates extends SearchBooksStates{}

class ErrorSearchBooksStates extends SearchBooksStates{
  final String error;

  ErrorSearchBooksStates(this.error);
}