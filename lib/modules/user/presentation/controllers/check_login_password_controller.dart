import 'package:aqueduct/aqueduct.dart';
import 'package:injectable/injectable.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:login_with_bloc_api/modules/user/domain/exception/user_not_found_exception.dart';
import 'package:login_with_bloc_api/modules/user/domain/usecases/login_with_user_password.dart';
import 'package:login_with_bloc_api/modules/user/presentation/models/check_login_request.dart';

@LazySingleton()
class CheckLoginPasswordController extends ResourceController {
  final LoginWithUserPassword _useCase;

  CheckLoginPasswordController(this._useCase);

  @Operation.post()
  Future<Response> checkLogin(@Bind.body() CheckLoginRequest requestLogin) async {
    try {
      final userResult = await _useCase(requestLogin.login, requestLogin.password);

      return Response.ok({"token": generateJWTToken(userResult.id)});
    } catch (e) {

      if(e is UserNotFoundException) {
        return Response.forbidden(body: {'message': 'Acesso Negado!!!!'});
      }

      return Response.serverError(body: {'message': e.toString()});

    }
  }

  String generateJWTToken(int userId) {
    final claimSet = JwtClaim(
      issuer: 'http//localhost',
      subject: userId.toString(),
      expiry: DateTime.now().add(const Duration(days: 1)),
      notBefore: DateTime.now(),
      issuedAt:  DateTime.now(),
      otherClaims: <String,dynamic>{},
      maxAge: const Duration(days: 1)
    );

    return issueJwtHS256(claimSet, 'LOGIN_WITH_BLOC_API');
  }
}
