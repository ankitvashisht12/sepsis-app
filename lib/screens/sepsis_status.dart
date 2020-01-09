import 'package:flutter/material.dart';


class SepsisStatus extends StatefulWidget {
  @override
  _SepsisStatusState createState() => _SepsisStatusState();
}

class _SepsisStatusState extends State<SepsisStatus> {
  
  Widget greenTick(BuildContext context){
    return SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: Card(
          child: InkWell(
            child: Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
      ),
    );
  }

  Widget sepsisStatusText(BuildContext context){
    return Text(
      "You're Good to go.",
      style: TextStyle(
       color: Theme.of(context).primaryColor,
       fontSize: 30,
       fontFamily: 'Poppins',
       fontWeight: FontWeight.bold,
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            greenTick(context),
            SizedBox(height: 10.0,),
            sepsisStatusText(context)
          ],
        ),
      ),
    );
  }
}