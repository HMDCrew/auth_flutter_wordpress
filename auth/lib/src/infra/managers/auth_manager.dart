import 'package:auth/auth.dart';

class AuthManager {
  final IAuthApi _api;
  AuthManager(this._api);

  IAuthService service(AuthType? type) {
    late IAuthService service;

    switch (type) {
      case AuthType.google:
        // Login with google is not implemented
        service = GoogleAuth(_api);
        break;
      case AuthType.email:
        service = EmailAuth(_api);
        break;
      default:
        throw UnimplementedError();
    }

    return service;
  }
}
