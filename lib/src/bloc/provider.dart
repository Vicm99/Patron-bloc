import 'package:flutter/material.dart';
import 'package:bloc/src/bloc/bloc.dart';

class Provider extends InheritedWidget{

  Provider({Key? key, required Widget child}) : super (key: key, child: child);

  final bloc = Bloc();

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
}