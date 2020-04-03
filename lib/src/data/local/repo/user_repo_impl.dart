import 'package:flutterdatabase/src/data/local/dao/user_dao.dart';
import 'package:flutterdatabase/src/data/local/dao_factory.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/local/repo/base_repo_impl.dart';
import 'package:flutterdatabase/src/data/local/repo/user_repo.dart';

class UserRepoImpl extends BaseRepoImpl<User> implements UserRepo {
  UserDao _userDao;

  UserRepoImpl() {
    _userDao = baseDAO = dao.userDAO;
  }

  @override
  Future<List<User>> getUsers() {
    return _userDao.getAll();
  }
}
