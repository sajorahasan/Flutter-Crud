import 'package:flutterdatabase/src/data/local/dao/base_dao.dart';
import 'package:flutterdatabase/src/data/local/repo/base_repo.dart';

abstract class BaseRepoImpl<T> implements BaseRepo<T> {
  BaseDAO baseDAO;

  Future<int> insert(T entity) {
    return baseDAO.insert(entity);
  }

  Future insertAll(List<T> entityList) {
    return baseDAO.insertAll(entityList);
  }

  Future<int> update(T entity) {
    return baseDAO.update(entity);
  }

  Future updateAll(List<T> entityList) {
    return baseDAO.updateAll(entityList);
  }

  Future<List<T>> getAll() {
    return baseDAO.getAll();
  }

  Future<T> getById(int id) {
    return baseDAO.getById(id);
  }

  Future<int> deleteById(int id) {
    return baseDAO.deleteById(id);
  }

  Future clear() {
    return baseDAO.clear();
  }
}
