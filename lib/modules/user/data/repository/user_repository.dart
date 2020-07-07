import 'package:injectable/injectable.dart';
import 'package:login_with_bloc_api/modules/user/data/datasource/i_user_datasource.dart';
import 'package:login_with_bloc_api/modules/user/domain/entities/user.dart';
import 'package:login_with_bloc_api/modules/user/domain/exception/user_not_found_exception.dart';
import 'package:login_with_bloc_api/modules/user/domain/ports/i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  
  final IUserDataSource _datasource;

  UserRepository(this._datasource);

  @override
  Future<User> getUserByLoginAndPassword(String login, String password) async {
    try {
      final user = await _datasource.getUserLogin(login, password);

      if(user == null) {
        throw UserNotFoundException();
      }

      return user;
    } catch (e) {
      rethrow;
    }
  }

}