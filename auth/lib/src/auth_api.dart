import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  final http.Client _client;
  String baseUrl;

  AuthApi(this._client, this.baseUrl);

  Future<Result<String>> signIn({
    required String username,
    required String password,
  }) async {
    final endpoint = "$baseUrl/wp-json/jwt-auth/v1/token";

    return await _postCredential(
        endpoint, {'username': username, 'password': password});
  }

  Future<Result<String>> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    String pluginToken = 'MySuperSecretToken',
  }) async {
    final endpoint = "$baseUrl/wp-json/wpr-register";
    return await _postCredential(endpoint, {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'repeat_password': repeatPassword,
      'plugin_token': pluginToken
    });
  }

  Future<Result<String>> _postCredential(
    String endpoint,
    Map<String, String> credential,
  ) async {
    final response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(credential),
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

  String _transformError(Map map) {
    final contents = map['error'] ?? map['errors'];
    if (contents is String) return contents;
    final errorStr =
        contents.fold('', (prev, ele) => prev + ele.values.first + '\n');

    return errorStr.trim();
  }
}
