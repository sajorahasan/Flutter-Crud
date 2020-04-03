abstract class BaseRepo<T> {
  Future<int> insert(T entity);

  void insertAll(List<T> entityList);

  Future<int> update(T entity);

  void updateAll(List<T> entityList);

  Future<List<T>> getAll();

  Future<T> getById(int id);

  Future<int> deleteById(int id);

  Future clear();
}
