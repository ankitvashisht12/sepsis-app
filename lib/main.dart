import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sepsis/screens/add_manual_entry.dart';
import 'package:sepsis/screens/loading_screen.dart';
import 'package:sepsis/screens/sepsis_status.dart';
import 'screens/dashboard.dart';
import 'screens/health_tips.dart';
import 'screens/account.dart';
import 'screens/login_screen.dart';
import 'screens/signup.dart';
import 'screens/notification.dart';
import 'screens/addfavcontact.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        "/landingpage" : (BuildContext context)=>new MyApp(),
        "/signup" : (BuildContext context)=> new Signup(),
        "/homepage": (BuildContext context)=> new MyHomePage(),
        "/addentrypage" : (BuildContext context)=> new AddManualEntry(),
        "/sepsispage" : (BuildContext context)=> new SepsisStatus(),
        "/loading" : (BuildContext context)=> new LoadingScreen(),
        "/notification": (BuildContext context)=> new MyNotification(),
        "/addfavpage": (BuildContext context)=> new AddFavContact(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget changeScreen(int curIdx) {
    switch (curIdx) {
      case 0:
        return Dashboard();
        break;

      case 1:
        return HealthTips();
        break;

      case 2:
        return Account();
        break;

      default:
        return Dashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: changeScreen(_currentIndex),
      
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.account_circle, size: 30),
        ],
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
