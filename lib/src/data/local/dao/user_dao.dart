import 'package:flutterdatabase/src/data/local/dao/base_dao.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';

abstract class UserDao implements BaseDAO<User> {
  static const String ID = "id";
  static const String NAME = "name";
  static const String EMAIL = "email";
  static const String GENDER = "gender";
  static const String AGE = "age";

  static const String TABLE_NAME = "user";

  static const String CREATE_QUERY = "CREATE TABLE IF NOT EXISTS `" +
      TABLE_NAME + "` (`" + ID + "` INTEGER PRIMARY KEY NOT NULL, " +
      "`" + NAME + "` TEXT NOT NULL, `" + EMAIL + "` TEXT, `" +
      GENDER + "` TEXT," + "`" + AGE + "` INTEGER)";

//  Future<int> addUser(Map<String, dynamic> row);
//
//  Future<List<User>> getUser(List<int> idList);
//
//  Future<int> updateUser(List<int> idList);
//
//  Future<List<Map<String, dynamic>>> queryAlUserl();
//
//  Future<int> deleteUser(int id);
//
//  Future deleteAllUser();
}
