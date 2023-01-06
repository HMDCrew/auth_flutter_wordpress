import 'package:async/async.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';

class SignUpUserCase {
  final ISignUpService _signUpService;

  SignUpUserCase(this._signUpService);

  Future<Result<Token>> execute(
    String name,
    String email,
    String username,
    String password,
    String repeatPassword,
  ) async {
    return await _signUpService.signUp(
      name,
      email,
      username,
      password,
      repeatPassword
    );
  }
}
