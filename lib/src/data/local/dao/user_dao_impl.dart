import 'package:flutterdatabase/src/data/local/app_database.dart';
import 'package:flutterdatabase/src/data/local/dao/user_dao.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';

class UserDAOImpl implements UserDao {
  @override
  Future<int> insert(User user) async {
    final db = await AppDatabase.get().database;
    return await db.insert(UserDao.TABLE_NAME, user.toMap());
  }

  @override
  Future insertAll(List<User> userList) async {
    final db = await AppDatabase.get().database;
    var batch = db.batch();
    for (var user in userList) {
      batch.insert(UserDao.TABLE_NAME, user.toMap());
    }
    batch.commit();
  }

  @override
  Future<int> update(User user) async {
    final db = await AppDatabase.get().database;
    return await db.update(UserDao.TABLE_NAME, user.toMap(),
        where: UserDao.ID + "=?", whereArgs: [user.id]);
  }

  @override
  Future updateAll(List<User> entityList) {
    // TODO: implement updateAll
    return null;
  }

  @override
  Future<List<User>> getAll() async {
    final db = await AppDatabase.get().database;
    var res = await db.query(UserDao.TABLE_NAME);
    return res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];
  }

  @override
  Future<User> getById(int id) async {
    final db = await AppDatabase.get().database;
    var res = await db
        .query(UserDao.TABLE_NAME, where: UserDao.ID + "=?", whereArgs: [id]);

    return res != null ? res.map((c) => User.fromMap(c)) : {};
  }

  @override
  Future<int> deleteById(int id) async {
    final db = await AppDatabase.get().database;
    return db
        .delete(UserDao.TABLE_NAME, where: UserDao.ID + "= ?", whereArgs: [id]);
  }

  @override
  Future clear() async {
    final db = await AppDatabase.get().database;
    db.delete(UserDao.TABLE_NAME);
  }
}
