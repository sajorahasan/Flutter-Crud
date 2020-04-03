import 'package:flutterdatabase/src/data/local/dao/user_dao.dart';
import 'package:flutterdatabase/src/data/local/dao/user_dao_impl.dart';

var dao = new DAOFactory();

class DAOFactory {
  UserDao _userDao;

  DAOFactory() {
    _userDao = UserDAOImpl();
  }

  UserDao get userDAO => _userDao;
}
