import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoadingBouncingGrid.square(
              borderSize: 3.0,
              size: 150.0,
              backgroundColor: Colors.cyanAccent,
              duration: Duration(milliseconds: 500),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text("Loading...",
                
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30.0,
                  color: Colors.blue
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}