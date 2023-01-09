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

(the autentication is based on JWT auth)
for that need install other plugins on wordpress



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
