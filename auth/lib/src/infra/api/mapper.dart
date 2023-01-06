import 'package:auth/src/domain/credential.dart';

class Mapper {
  static Map<String, dynamic> toJson( Credential credential ) => {
    'auth_type': credential.type.toString().split('.').last,
    'name': credential.name,
    'username': credential.username,
    'email': credential.email,
    'password': credential.password,
    'repeat_password': credential.repeatPassword,
    'plugin_token': credential.pluginToken ?? 'MySuperSecretToken',
  };
}