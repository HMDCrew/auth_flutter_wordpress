import 'package:async/async.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/domain/token.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

class EmailAuth implements IAuthService {
  final IAuthApi _api;
  Credential? _credential;
  EmailAuth(this._api);

  void credential({
    required String email,
    required String password,
  }) {
    _credential = Credential(
      type: AuthType.email,
      email: email,
      username: email,
      password: password
    );
  }

  @override
  Future<Result<Token>> signIn() async {
    assert(_credential != null);
    final result = await _api.signIn(_credential!);
    if (result.isError) return result.asError!;
    return Result.value(Token(result.asValue!.value));
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    return await _api.signOut(token);
  }
}
