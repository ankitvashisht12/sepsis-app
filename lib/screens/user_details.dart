import 'package:flutter/material.dart';


class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  
  
  final Color bgColor = Color(0xffF3F3F3);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Enter Details",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        titleSpacing: 10.0,
        
      ),



      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createField("Name"),
            SizedBox(height: 15.0,),
            createNumberField("Mobile"),
            SizedBox(height: 15.0,),
            createField("Address"),
            SizedBox(height: 15.0,),
            createNumberField("Age"),
            SizedBox(height: 15.0,),
            createField("Email"),
            SizedBox(height: 15.0,),
            createField("Aadhaar Card Number"),
            SizedBox(height: 15.0,),
            saveButton()
          ],
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

  Widget saveButton(){
    return RaisedButton(
      onPressed: (){
        Navigator.of(context).pop();
      
      },
      child: Text("Save"),
      color: Colors.greenAccent,
    );
  }

}