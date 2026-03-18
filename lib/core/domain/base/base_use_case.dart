abstract class UseCase<T, P> {
  Future<T> call(P p);
}

abstract class NoParamsUseCase<T> {
  Future<T> call();
}

abstract class UseCaseAppStorage<T, P> {
  call(P p);
}
