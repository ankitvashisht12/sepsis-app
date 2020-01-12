import 'package:flutter/material.dart';


class SepsisStatus extends StatefulWidget {
  @override
  _SepsisStatusState createState() => _SepsisStatusState();
}

class _SepsisStatusState extends State<SepsisStatus> {
  
  // Widget greenTick(BuildContext context){
  //   return SizedBox(
  //       height: MediaQuery.of(context).size.height/2,
  //       child: Card(
  //         child: InkWell(
  //           child: Icon(
  //             Icons.done,
  //             color: Colors.green,
  //           ),
  //         ),
  //     ),
  //   );
  // }

  // Widget sepsisStatusText(BuildContext context){
  //   return Text(
  //     "You're Good to go.",
  //     style: TextStyle(
  //      color: Theme.of(context).primaryColor,
  //      fontSize: 30,
  //      fontFamily: 'Poppins',
  //      fontWeight: FontWeight.bold,
  //      ),
  //   );
  // }

  _greenTickAnimation(){
    bool _size = true;

    return Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {

          AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _size ? 100 : 500,
              child: Icon(Icons.check_circle, color: Colors.green),
            );
          _size = !_size;
        });
    });
  }


  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            //_greenTickAnimation(),
             Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  
                ),
                child: Image.asset(
                  'assets/img/green.png',
                  width: 60,
                ),
            ),
            

            Text("NO Sepsis found.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 30.0,
                color: Colors.green
              ),
            ),
            Text("You're good to go !",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15.0,
                color: Colors.greenAccent
              ),
            )
          ],
      ),
        ),
    );
  }
}