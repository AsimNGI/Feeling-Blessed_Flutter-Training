/// Domain-level result type for success/error.
/// Used by use cases and repository contracts; data layer maps to this.
abstract class DataState<T> {
  final T? data;
  final String? error;

  const DataState({this.data, this.error});
}

class Success<T> extends DataState<T> {
  Success(T data) : super(data: data);
}

class Error<T> extends DataState<T> {
  Error(String error) : super(error: error);
}
