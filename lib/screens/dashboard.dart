import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SEPSIS"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            label: "Take OCR",
            onTap: ()=>print("Taking OCR")
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Add Manually",
            onTap: ()=>print("Taking OCR")
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).primaryColor.withAlpha(50),
                        ),
                        child: Image.asset(
                          'assets/img/bolt.png',
                          width: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text(
                        'Good Morning, Ankit',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            LinearPercentIndicator(
                              lineHeight: 8.0,
                              percent: 0.95,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              backgroundColor:
                                  Theme.of(context).accentColor.withAlpha(30),
                              progressColor: Colors.green,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'OXYGEN',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '89',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' %',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '2500',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' cal',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'HEART RATE',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '102',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' bpm',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                    ],
                  )))),
    );
  }
}
