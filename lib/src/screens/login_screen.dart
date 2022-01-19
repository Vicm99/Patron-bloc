import 'package:flutter/material.dart';
import 'package:bloc/src/bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(bloc) {
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

  Widget passwordField(bloc) {
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
