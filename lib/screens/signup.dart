import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sepsis/services/user_management.dart';
import 'package:sepsis/mixins/validation_mixin.dart';
import 'package:sepsis/model/form_values.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with ValidationMixin {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createField("Name"),
              SizedBox(height: 15.0,),
              emailInputField(),
              passwordInputField(),
              createNumberField("Mobile"),
              SizedBox(height: 15.0,),
              createField("Address"),
              SizedBox(height: 15.0,),
              createNumberField("Age"),
              SizedBox(height: 15.0,),
              
              createNumberField("Aadhaar Card Number"),
              SizedBox(height: 15.0,),
              
              
              submitButton(),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget createField(fieldtitle) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            autofocus: true,
            onSaved: (String value){
              //save email to form (model class)  
            },    
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: '$fieldtitle',
              // hintText: 'Example : 35',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            )
        )
    );
  }


  Widget createNumberField(fieldtitle) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            autofocus: true,
            onSaved: (String value){
              //save email to form (model class)  
            },    
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '$fieldtitle',
              // hintText: 'Example : 35',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            )
        )
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
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: FormVal.email,
                    password: FormVal.password,
                    
                  ).then((signedInUser){
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e){
                    print(e);
                  });
        },
        child: Text("Sign Up"),
        splashColor: Colors.green,
        color: Colors.blue,
        colorBrightness: Brightness.dark,
        //shape: BoxDecoration(borderRadius: 23),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         padding: EdgeInsets.all(25.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             TextField(
  //               decoration: InputDecoration(hintText: "Email"),
  //               onChanged: (value){
  //                 setState(() {
  //                   _email = value;
  //                 });
  //               },
  //             ),
  //             SizedBox(height: 15.0,),
  //             TextField(
  //               decoration: InputDecoration(hintText: "Password"),
  //               onChanged: (value){with ValidationMixin
  //                 setState(() {
  //                   _email = value;
  //                 });
  //               },
  //             ),
  //             SizedBox(height: 20.0,),
      
  //             RaisedButton(
  //               color: Colors.blue,
  //               child: Text("Sign Up"),
  //               onPressed: (){
                  // FirebaseAuth.instance.createUserWithEmailAndPassword(
                  //   email: _email,
                  //   password: _password
                  // ).then((signedInUser){
                  //   UserManagement().storeNewUser(signedInUser, context);
                  // }).catchError((e){
                  //   print(e);
                  // });
  //               },
  //               textColor: Colors.white,
  //               elevation: 7.0,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
      
  //   );
  // }
}