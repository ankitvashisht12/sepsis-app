import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var FavouritesNames = [
    'Mom',
    'Dad',
    'Brother',
    'Sister',
    'Uncle',
    'Aunt',
    'Abhishek',
    'Yukti'
  ];
  var FavouritesNumbers = [
    8014067473,
    8014196155,
    8014223329,
    8014399018,
    8014436766,
    8014574260,
    8014694979,
    8014766977
  ];

  // Helper function : show favourites
  _showFavouritesOption(cx) {
    showModalBottomSheet(
        context: cx,
        builder: (BuildContext bcx) {
          return ListView.builder(
            itemCount: FavouritesNames.length,
            itemBuilder: (cx, idx) {
              var name = FavouritesNames[idx];
              var number = FavouritesNumbers[idx];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png'),
                ),
                title: Text(
                  "$name",
                ),
                subtitle: Text("$number"),
                trailing: IconButton(
                  icon: Icon(Icons.minimize, color: Colors.red,),
                  onPressed: () {},
                ),
              );
            },
          );
        });
  }



  // Helper Function: show More Option
  _showMoreOption(cx) {
    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.video_library,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Take Courses',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person_pin,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Talk to Expert',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
                      ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final Color bgColor = Color(0xffF3F3F3);
    return Scaffold(
      
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Account",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        titleSpacing: 10.0,
        
      ),

      body : Container(
      child: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          // For thumbnail image
                          child: Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://beckerlawyers.com/wp-content/uploads/2018/07/responsive-lightbox-thumbnail.png'))),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      // For Profile Pic
                      top: 50.0,
                      child: Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png'),
                            ),
                            border:
                                Border.all(color: Colors.white, width: 6.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ankit V.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.0, fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.brightness_high,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  child: Text(
                'Sepsis Stage 1',
                style: TextStyle(fontSize: 18.0,fontFamily: "Bebas"),
              )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.supervisor_account,
                              color: Colors.blueAccent),
                          onPressed: () {
                            _showFavouritesOption(context);
                          },
                        ),
                        Text(
                          'Favourites',
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.notifications, color: Colors.black),
                          onPressed: () {
                            //_showNotifications(context);
                            Navigator.of(context).pushNamed('/notification');
                          },
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.black),
                          onPressed: () {
                            _showMoreOption(context);
                          },
                        ),
                        Text(
                          'More',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/addfavpage');
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("Add Favourites",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20.0
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut().
                            then((value){
                              Navigator.of(context).pushReplacementNamed('/landingpage');
                            }).
                            catchError((e){print(e);});
                          },
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          child: Text("Sign Out",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20.0
                          ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    )
    );
  }
}

