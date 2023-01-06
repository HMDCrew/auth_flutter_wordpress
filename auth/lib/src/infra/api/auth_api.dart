import 'dart:convert';

import 'package:auth/src/domain/credential.dart';
import 'package:async/async.dart';
import 'package:auth/src/domain/token.dart';
import 'package:auth/src/infra/api/mapper.dart';
import 'package:http/http.dart' as http;
import 'package:auth/src/infra/api/auth_api_contract.dart';

class AuthApi implements IAuthApi {
  final http.Client _client;
  String baseUrl;

  AuthApi(this._client, this.baseUrl);

  @override
  Future<Result<String>> signIn(Credential credential) async {
    final endpoint = "$baseUrl/wp-json/jwt-auth/v1/token";
    return await _postCredential(endpoint, credential);
  }

  @override
  Future<Result<String>> signUp(Credential credential) async {
    final endpoint = "$baseUrl/wp-json/wpr-register";
    return await _postCredential(endpoint, credential);
  }

  Future<Result<String>> _postCredential(
      String endpoint, Credential credential) async {
    final response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(Mapper.toJson(credential)),
        headers: {"Content-type": "application/json"});

    final json = jsonDecode(response.body);

    if (response.statusCode != 200) {
      Map map = jsonDecode(response.body);
      return Result.error(_transformError(map));
    }
    
    String token = json?['message']?['data']?['token'] ?? json['token'];

    return token.isNotEmpty
        ? Result.value(token)
        : Result.error(json['message']);
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    final url = "$baseUrl/auth/signout";
    final header = {
      "Content-type": "application/json",
      "Authorization": token.value
    };

    final response = await _client.post(Uri.parse(url), headers: header);

    if (response.statusCode != 200) return Result.value(false);

    return Result.value(true);
  }

  String _transformError(Map map) {
    final contents = map['error'] ?? map['errors'];
    if (contents is String) return contents;
    final errorStr =
        contents.fold('', (prev, ele) => prev + ele.values.first + '\n');

    return errorStr.trim();
  }
}
