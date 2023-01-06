import 'package:async/async.dart';
import 'package:auth/auth.dart';
import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

class SignUpService implements ISignUpService {
  final IAuthApi _api;
  SignUpService(this._api);

  @override
  Future<Result<Token>> signUp(
    String name,
    String email,
    String username,
    String password,
    String repeatPassword,
  ) async {
    Credential credential = Credential(
      type: AuthType.email,
      email: email,
      name: name,
      username: username,
      password: password,
      repeatPassword: repeatPassword
    );

    final result = await _api.signUp(credential);
    if (result.isError) return result.asError!;
    return Result.value(Token(result.asValue!.value));
  }
}
