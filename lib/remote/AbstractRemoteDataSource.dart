
abstract class RemoteDataSource<T> {
  Future<List<T>> getItems();
}