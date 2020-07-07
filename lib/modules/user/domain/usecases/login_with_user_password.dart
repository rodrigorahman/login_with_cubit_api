import 'package:injectable/injectable.dart';
import 'package:login_with_bloc_api/modules/user/domain/entities/user.dart';
import 'package:login_with_bloc_api/modules/user/domain/ports/i_user_repository.dart';

@LazySingleton()
class LoginWithUserPassword {
  
  final IUserRepository _repository;

  LoginWithUserPassword(this._repository);

  Future<User> call(String login, String password) {
    return _repository.getUserByLoginAndPassword(login, password);
  }
}