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
TextField(
  decoration: const InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
    hintText: 'Username',
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  onChanged: (val) {
    _username = val;
  },
),
const SizedBox(height: 30.0),
TextField(
  decoration: const InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
    hintText: 'Email',
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  onChanged: (val) {
    _email = val;
  },
),
const SizedBox(height: 30.0),
TextField(
  decoration: const InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
    hintText: 'Password',
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  obscureText: true,
  onChanged: (val) {
    _password = val;
  },
),
const SizedBox(height: 30.0),
TextField(
  decoration: const InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
    hintText: 'Repeat password',
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  obscureText: true,
  onChanged: (val) {
    _password = val;
  },
),
ElevatedButton(
  onPressed: () async {
    final result = await signupService.signUp('test name', _email, _username, _password, _password);
    setState(() {
      token = result.asValue!.value.value.toString();
    });
  },
  child: Container(
    alignment: Alignment.center,
    child: Text(
      'Sign Up',
      style: Theme.of(context).textTheme.button?.copyWith(
            color: Colors.white,
            fontSize: 18.0,
          ),
    ),
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
