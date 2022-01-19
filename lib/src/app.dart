import 'package:bloc/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'bloc/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        key: key,
        child: MaterialApp(
          home: Scaffold(
            body: LoginScreen(),
          ),
        ));
  }
}
