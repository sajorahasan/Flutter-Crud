abstract class BaseDAO<T> {
  Future<int> insert(T entity);

  Future insertAll(List<T> entityList);

  Future<int> update(T entity);

  Future updateAll(List<T> entityList);

  Future<List<T>> getAll();

  Future<T> getById(int id);

  Future<int> deleteById(int id);

  Future clear();
}
