import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/local/repo/base_repo.dart';

abstract class UserRepo implements BaseRepo<User> {
  Future<List<User>> getUsers();

//Future<User> getUser(int id);
}
