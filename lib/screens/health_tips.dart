import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {


  var articleList = [
    ["https://www.healthline.com/nutrition/27-health-and-nutrition-tips#section2", "27 Health and Nutrition Tips That Are Actually Evidence-Based", "It’s easy to get confused when it comes to health and nutrition.Even qualified experts often se....", "https://static-news.moneycontrol.com/static-mcnews/2018/10/critical-illness-health-insurance-1280x-720-770x433.jpg"],
    ["https://www.youtube.com/watch?v=4egM_a_nmKk","Top 5 Heart Health Tips","A registered dietitian in Sunnybrook's heart program offers easy heart health tips that ...","https://www.orfonline.org/wp-content/uploads/2019/04/Health-as-a-poll-issue.jpg"],
    ["https://www.webmd.com/balance/features/health-tips-heart-mind-body#1","Women's Health Tips for Heart, Mind, and Body","Looking for the path toward a healthier you? It's not hard to find. The journey begins with some simple tweak...","https://www.studying-in-germany.org/wp-content/uploads/2018/06/health-1.png"],
  ];

  // _showCategoryTitle(title){
  //   return Text(
  //     '$title',
  //     style: TextStyle(
  //       color: Colors.black,
  //       fontSize: 30,
  //       fontFamily: 'Poppins',
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }

  // _showArticleCard(pageUrl, title, subtitle, thumbnailUrl){
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       child: Row(
  //         children: <Widget>[

  //         ],
  //       ),
  //     ),
  //   );
  // }


  _showArticleCard(pageUrl, title, subtitle, thumbnailUrl){
    return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(thumbnailUrl),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Liverpool beat Lyon in Geneva to end pre-season",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Yesterday, 9:24 PM",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Football",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  _showThumbnail(thumbnailUrl){
    return Container(
      child: Image.network(thumbnailUrl),
    );
  }

  _openUrl(pageUrl){
    launch(pageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("HEALTH"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (context, idx){
            var pageUrl = articleList[idx][0];
            var title = articleList[idx][1];
            var subtitle = articleList[idx][2];
            var thumbnailUrl = articleList[idx][3];
            return _showArticleCard(pageUrl, title, subtitle, thumbnailUrl);

            // return ListTile(
            //   title: Text("$title"),
            //   subtitle: Text("$subtitle"),
            //   trailing: _showThumbnail(thumbnailUrl),
            //   onTap: _openUrl(pageUrl)
            // );
          },
        )
      
      ),
    );
  }
}
