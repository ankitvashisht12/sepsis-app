import 'package:flutter/material.dart';
import 'package:sepsis/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            emailInputField(),
            passwordInputField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailInputField() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            autofocus: true,
            onSaved: (String value){
              print(value);
            },
            validator: emailValidationMixin,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'you@example.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            )));
  }

  Widget passwordInputField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          obscureText: true,
          onSaved: (String value){
              print(value);
            },
          validator: passwordValidationMixin,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget submitButton() {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(formKey.currentState.validate())
            formKey.currentState.save();
        },
        child: Text("Sign In"),
        splashColor: Colors.green,
        color: Colors.blue,
        colorBrightness: Brightness.dark,
        //shape: BoxDecoration(borderRadius: 23),
      ),
    );
  }
}
