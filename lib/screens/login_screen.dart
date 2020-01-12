import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepsis/mixins/validation_mixin.dart';
import 'package:sepsis/model/form_values.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailInputField(),
              passwordInputField(),
              submitButton(),
              SizedBox(height: 15.0,),
                Text("Don't have a account"),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Sign Up"),
                  onPressed: (){
                    Navigator.of(context).pushNamed("/signup");
                  },
                  textColor: Colors.white,
                  elevation: 7.0,
                ),
            ],
          ),
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
              //save email to form (model class)
              FormVal.email = value;
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
              // save password to form (model class)
              FormVal.password = value;
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
            print("email is ${FormVal.email} and password is ${FormVal.password}");
            FirebaseAuth.instance.signInWithEmailAndPassword(
              email: FormVal.email,
              password: FormVal.password
            ).then((user){
              Navigator.of(context).pushReplacementNamed('/homepage');
            }).catchError((e){
              print(e);
            });
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
