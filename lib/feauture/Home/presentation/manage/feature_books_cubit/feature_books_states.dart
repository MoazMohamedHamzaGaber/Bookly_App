abstract class FeatureBooksStates{}

class InitialFeatureBooksStates extends FeatureBooksStates{}

class LoadingFeatureBooksStates extends FeatureBooksStates{}

class SuccessFeatureBooksStates extends FeatureBooksStates{}

class ErrorFeatureBooksStates extends FeatureBooksStates{
  final String error;

  ErrorFeatureBooksStates(this.error);
}