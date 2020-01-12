import 'package:flutter/material.dart';


class AddFavContact extends StatefulWidget {
  @override
  _AddFavContactState createState() => _AddFavContactState();
}

class _AddFavContactState extends State<AddFavContact> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createNameField("Name"),
            SizedBox(height: 15.0,),
            createMobileField("Mobile"),
            SizedBox(height: 15.0,),
            saveButton()
          ],
        ),
      ),
    );
    
  }

  Widget createNameField(fieldtitle) {
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


  Widget createMobileField(fieldtitle) {
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
      color: Colors.blue,
    );
  }
}

