import 'package:injectable/injectable.dart';
import 'package:login_with_bloc_api/core/database/i_database_connection.dart';
import 'package:login_with_bloc_api/core/exception/exceptions.dart';
import 'package:login_with_bloc_api/core/utils/cripty_utils.dart';
import 'package:login_with_bloc_api/modules/user/data/model/login_model.dart';

import 'i_user_datasource.dart';

@LazySingleton(as: IUserDataSource)
class UserDataSource implements IUserDataSource {

  final IDatabaseConnection _database;

  UserDataSource(this._database);

  @override
  Future<LoginModel> getUserLogin(String login, String password) async {
    final connection = await _database.openConnection();

    try {
      final queryResult = await connection.query('''
        select user_id, user_login, user_password 
        from user_system
        where user_login = ?
        and user_password = ?
      ''', [login, CriptyUtils.generateSha256Hash(password)]);

      if(queryResult.isEmpty) {
        return null;
      }

      return LoginModel.mapper(queryResult.first.asMap());

    } catch (e, s) {
      print(e);
      print(s);
    
      throw DatabaseException('Erro ao realizar login');
    } finally {
      await connection.close();
    }
  }
}