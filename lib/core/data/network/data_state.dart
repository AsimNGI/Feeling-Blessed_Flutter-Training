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
