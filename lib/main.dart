import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static String baseUrl = "https://dev-dominewptest.pantheonsite.io/";
  static Client client = Client();
  static IAuthApi authApi = AuthApi(client, baseUrl);
  static EmailAuth emailAuth = EmailAuth(authApi);
  ISignUpService signupService = SignUpService(authApi);

  String _username = '';
  String _email = '';
  String _password = '';

  String token = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100.0),
                const Text('Login section'),
                Text(token),
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
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 100.0),
      
      
      
                const Text('Register section'),
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
                const SizedBox(height: 100.0),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
