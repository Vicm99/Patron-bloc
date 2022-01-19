import 'package:flutter/material.dart';
import 'package:bloc/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'You@example.com',
                  labelText: 'Email',
                  errorText: snapshot.error?.toString()
                  //errorText: snapshot.hasError ? snapshot.error.toString() : " ",
                  ),
              onChanged: bloc.changeEmail);
        });
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                errorText: snapshot.error?.toString()
              ),
              onChanged: bloc.changePassword);
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text('Enviar'),
      onPressed: () {},
    );
  }
}
