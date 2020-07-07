import 'package:login_with_bloc_api/login_with_bloc_api.dart';

class CheckLoginRequest extends Serializable {
  String login;
  String password;

  @override
  Map<String, dynamic> asMap() {
    return {
      "login" : login,
      "password": password
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    password = object['password'] as String;
  }
}