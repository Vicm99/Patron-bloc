import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData:(email, sink){
    if (email.contains('@')){
      sink.add(email);
    }else{
      sink.addError('Formato de correo invalido');
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink){
    if (password.length > 5){
      sink.add(password);
    }else{
      sink.addError('La contraseña debe contener como mínimo 6 caracteres');
    }
  });
}