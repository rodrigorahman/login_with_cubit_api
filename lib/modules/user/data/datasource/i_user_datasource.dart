import 'package:login_with_bloc_api/modules/user/data/model/login_model.dart';

abstract class IUserDataSource {
  Future<LoginModel> getUserLogin(String login, String password);
}