import 'package:async/async.dart';
import 'package:auth/src/domain/token.dart';

abstract class ISignUpService {
  Future<Result<Token>> signUp(
    String name,
    String email,
    String username,
    String password,
    String repeatPassword,
  );
}
