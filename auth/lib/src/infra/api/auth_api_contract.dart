import 'package:async/async.dart';
import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/domain/token.dart';

abstract class IAuthApi {
  Future<Result<String>> signIn(Credential credential);
  Future<Result<String>> signUp(Credential credential);
  Future<Result<bool>> signOut(Token token);
}
