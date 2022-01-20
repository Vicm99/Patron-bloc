import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25)),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {
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

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot){
          return ElevatedButton(
              child: Text('Enviar'),
              onPressed: snapshot.hasError ? bloc.submit : null,
          );
        });
  }
}
