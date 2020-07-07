import 'package:login_with_bloc_api/modules/user/domain/entities/user.dart';
import 'package:mysql1/mysql1.dart';

class LoginModel extends User {

  LoginModel.mapper(Map<int,dynamic> data) : super(
    id: data[0] as int,
    login: data[1] as String,
    password: (data[2] as Blob).toString(),
  );

}