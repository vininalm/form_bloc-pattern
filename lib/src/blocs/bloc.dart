import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword =  _password.value;

    print("Email is $validEmail and password is $validPassword");
  }

  dispose() {
    _email.close();
    _password.close();
  }

} 

