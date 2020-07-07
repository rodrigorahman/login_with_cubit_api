import 'package:login_with_bloc_api/modules/user/domain/entities/user.dart';

abstract class IUserRepository {
  Future<User> getUserByLoginAndPassword(String login, String password);
}