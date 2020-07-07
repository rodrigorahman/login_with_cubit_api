// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:login_with_bloc_api/core/database/database_connection.dart';
import 'package:login_with_bloc_api/core/database/i_database_connection.dart';
import 'package:login_with_bloc_api/modules/user/data/datasource/user_datasource.dart';
import 'package:login_with_bloc_api/modules/user/data/datasource/i_user_datasource.dart';
import 'package:login_with_bloc_api/modules/user/data/repository/user_repository.dart';
import 'package:login_with_bloc_api/modules/user/domain/ports/i_user_repository.dart';
import 'package:login_with_bloc_api/modules/user/domain/usecases/login_with_user_password.dart';
import 'package:login_with_bloc_api/modules/user/presentation/controllers/check_login_password_controller.dart';
import 'package:login_with_bloc_api/login_with_bloc_api.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<IDatabaseConnection>(() => DatabaseConnection());
  g.registerLazySingleton<IUserDataSource>(
      () => UserDataSource(g<IDatabaseConnection>()));
  g.registerLazySingleton<IUserRepository>(
      () => UserRepository(g<IUserDataSource>()));
  g.registerLazySingleton<LoginWithUserPassword>(
      () => LoginWithUserPassword(g<IUserRepository>()));
  g.registerLazySingleton<CheckLoginPasswordController>(
      () => CheckLoginPasswordController(g<LoginWithUserPassword>()));
}
