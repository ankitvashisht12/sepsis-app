import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
   
            child: Center(
            
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(Icons.notification_important, color: Colors.grey),
              ),
              Text("No new notification",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.0,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}