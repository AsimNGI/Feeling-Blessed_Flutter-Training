abstract class UseCase<T, P> {
  Future<T> call(P p); //directly call with object of the sub type. See callable classes
}

abstract class NoparamsUseCase<T> {
  Future<T> call(); //directly call with object of the sub type. See callable classes
}

abstract class UseCaseAppStorage<T, P> {
  call(P p); //directly call with object of the sub type. See callable classes
}
