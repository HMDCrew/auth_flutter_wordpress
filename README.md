# wordpress authentication module for Flutter (null-safe)
This module can be used by copying the "auth" folder into the application of your flutter project

## setup:
File -> pubspec.yaml 

```yaml
dependencies:
  flutter:
    sdk: flutter
  # Declare auth path in this file to use module in your project
  auth:
    path: ./auth
```


Widget example file:
```dart
// declare this variables to use it in your dart file
static String baseUrl = "https://dev-dominewptest.pantheonsite.io/"; // any wordpress url
static Client client = Client();
static IAuthApi authApi = AuthApi(client, baseUrl);
static EmailAuth emailAuth = EmailAuth(authApi);
ISignUpService signupService = SignUpService(authApi);

String _username = '';
String _name = '';
String _email = '';
String _password = '';

String token = '';
```
  
## Example registration

```dart
// TextField used for registration on wodpress
TextField(
  decoration: const InputDecoration(
    hintText: 'Name',
  ),
  onChanged: (val) {
    _name = val;
  },
),
TextField(
  decoration: const InputDecoration(
    hintText: 'Username',
  ),
  onChanged: (val) {
    _username = val;
  },
),
TextField(
  decoration: const InputDecoration(
    hintText: 'Email',
  ),
  onChanged: (val) {
    _email = val;
  },
),
TextField(
  decoration: const InputDecoration(
    hintText: 'Password',
  ),
  obscureText: true,
  onChanged: (val) {
    _password = val;
  },
),
TextField(
  decoration: const InputDecoration(
    hintText: 'Repeat password',
  ),
  obscureText: true,
  onChanged: (val) {
    _password = val;
  },
),

// This button set the auth token in your widget
ElevatedButton(
  onPressed: () async {
    final result = await signupService.signUp(_name, _email, _username, _password, _password);
    setState(() {
      token = result.asValue!.value.value.toString();
    });
  },
  child: Container(
    alignment: Alignment.center,
    child: Text('Sign Up'),
  ),
),
```

## Example login

```dart
// TextField used for login
TextField(
  decoration: const InputDecoration(
    hintText: 'Email',
  ),
  onChanged: (val) {
    _email = val;
  },
),
TextField(
  decoration: const InputDecoration(
    hintText: 'Password',
  ),
  obscureText: true,
  onChanged: (val) {
    _password = val;
  },
),

// Button to send request for login
ElevatedButton(
  onPressed: () async {
    emailAuth.credential(email: _email, password: _password);
    final result = await emailAuth.signIn();
    setState(() {
      token = result.asValue!.value.value.toString();
    });
  },
  child: Container(
    alignment: Alignment.center,
    child: Text('Sign In'),
  ),
),
```

### Note:
Requirement plugins:
[JWT Authentication for WP REST API](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/)
<br />
[Customn routes in plugin](https://github.com/HMDCrew/REST-API-WP-Woo)


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
