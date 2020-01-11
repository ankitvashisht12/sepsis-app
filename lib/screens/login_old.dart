import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String _email;
  String _password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blue,
                child: Text("Login"),
                onPressed: (){},
                textColor: Colors.white,
                elevation: 7.0,
              ),
              SizedBox(height: 15.0,),
              Text("Don't have a account"),
              RaisedButton(
                color: Colors.blue,
                child: Text("Sign Up"),
                onPressed: (){},
                textColor: Colors.white,
                elevation: 7.0,
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}