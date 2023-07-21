abstract class NewSetBooksStates{}

class InitialNewSetBooksStates extends NewSetBooksStates{}

class LoadingNewSetBooksStates extends NewSetBooksStates{}

class SuccessNewSetBooksStates extends NewSetBooksStates{}

class ErrorNewSetBooksStates extends NewSetBooksStates{
  final String error;

  ErrorNewSetBooksStates(this.error);
}