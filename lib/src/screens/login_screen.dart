import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "you@example.com",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Submit"),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      }
    );
  }
}
