import 'package:bloc/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}