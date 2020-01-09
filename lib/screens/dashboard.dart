import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sepsis/screens/sepsis_status.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var modelDependency = [
    ["ICU length-of-stay (hours since ICU admit)","ICULOS", 14.520393],
    ["Bilirubin direct (mg/dL)","Bilirubin_direct", 10.181544],
    ["Total bilirubin (mg/dL)","Bilirubin_total", 6.178287],
    ["Fibrinogen","Fibrinogen" , 5.897129],
    ["Respiration rate (breaths per minute)","Resp", 5.722527],
    ["Administrative identifier for ICU unit (MICU)","Unit1", 5.383108],
    ["Heart rate","HR", 5.060755],
    ["Blood urea nitrogen (mg/dL)","BUN", 4.432900],
    ["Temperature (Deg C)","Temp", 4.320148],
    ["Leukocyte count (count*10^3/µL)","WBC", 4.243034],
    ["Measure of excess bicarbonate (mmol/L)","BaseExcess", 3.473745],
    ["Partial pressure of carbon dioxide from arterial blood (mm Hg)","PaCO2", 3.326594],
    ["Creatinine","Creatinine", 3.258294],
    ["Fraction of inspired oxygen","FiO2", 3.093767],
    ["Partial thromboplastin time (seconds)","PTT", 3.05],
    ["Alkaline phosphatase (IU/L)","Alkalinephos", 2.87],
    ["Phosphate","Phosphate", 1.41],
    ["Glucose","Glucose", 1.11],
    ["Magnesium","Magnesium", 0.95],
    ["Gender","Gender", 0.84],
    ["Diastolic BP (mm Hg)","DBP", 0.82],
    ["Oxygen saturation from arterial blood","SaO2", 0.77],
    ["Platelets","Platelets", 0.54],
    ["pH","pH", 0.20],
    ["Age","Age", 0.08],
    ["Bicarbonate (mmol/L)","HCO3", -0.14],
    ["Systolic BP (mm Hg)","SBP", -0.18],
    ["Mean arterial pressure (mm Hg)","MAP", -0.36],
    ["Potassium","Potassium", -0.35],
    ["Pulse oximetry (%)","O2Sat", -1.06],
    ["Chloride","Chloride", -1.33],
    ["Calcium","Calcium",-2.03],
    ["Aspartate transaminase (IU/L)","AST",-2.09],
    ["Hematocrit (%)","Hct",-2.67],
    ["Hours between hospital admit and ICU admit","HospAdmTime",-3.03],
    ["Hemoglobin (g/dL)","Hgb",-4.27],
    ["Administrative identifier for ICU unit (SICU)","Unit2",-5.38],
  ];

  _showModelDependency(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return ListView.builder(
          itemCount: modelDependency.length,
          itemBuilder: (context, idx){
            var term = modelDependency[0][0];
            var shortTerm = modelDependency[0][1];
            var percent = modelDependency[0][2];

            return ListTile(
              title: Text("$term"),
              subtitle: Text("$shortTerm"),
              trailing: Text("$percent %"),
            );
          },
        );
      }
    );
  }

  createAlertDialog(BuildContext context){
    return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Coming Soon..."),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  elevation: 20.0,
                  ),
                barrierDismissible: true,
              ); 
  }

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
            onTap: ()=>createAlertDialog(context)
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Add Manually",
            onTap: (){
              SepsisStatus();
            }
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
                        child: Center(
                          child: FlatButton(
                            child: Text("Check Model Dependency"),
                            onPressed: (){
                              _showModelDependency(context);
                            },
                          ),
                        )
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
