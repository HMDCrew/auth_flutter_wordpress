import 'package:async/async.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/token.dart';

class SignOutUsecase {
  final IAuthService _authService;

  SignOutUsecase(this._authService);

  Future<Result<bool>> execute(Token token) async {
    return await _authService.signOut(token);
  }
}
