import 'package:flutterdatabase/src/data/local/repo/user_repo.dart';
import 'package:flutterdatabase/src/data/local/repo/user_repo_impl.dart';

var localRepository = new RepositoryFactory();

class RepositoryFactory {
  UserRepo _userRepo;

  RepositoryFactory() {
    _userRepo = UserRepoImpl();
  }

  UserRepo get userRepo => _userRepo;
}
