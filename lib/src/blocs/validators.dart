import 'dart:async';

mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      email.contains("@") ? sink.add(email) : sink.addError("Enter valid e-mail");
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      password.length > 3 ? sink.add(password) : sink.addError("Password must be at least 4 characters long");
    }
  );
}