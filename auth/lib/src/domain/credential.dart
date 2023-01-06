class Credential {
  final AuthType type;
  final String? name;
  final String? username;
  final String email;
  final String? password;
  final String? repeatPassword;
  final String? pluginToken;

  Credential({
    required this.type,
    this.name,
    this.username,
    required this.email,
    this.password,
    this.repeatPassword,
    this.pluginToken,
  });
}

enum AuthType{ email, google }