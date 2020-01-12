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
    ["https://www.healthaffairs.org/doi/full/10.1377/hlthaff.2019.00339", "Preventing Sepsis By Reimagining Systems And Engaging Patients", "As Maria Lopez and her mother describe that day last October, they keep returning to the suddenness of it all. Just the night before, Maria had felt strong enough...", "https://www.cdc.gov/sepsis/images/sepsis_infographic_four_steps_tw1.jpg"],
    ["https://www.mayoclinic.org/diseases-conditions/sepsis/symptoms-causes/syc-20351214","Sepsis - Symptoms and Causes","Sepsis is a potentially life-threatening condition caused by the body's response to an infection. The body normally releases chemicals into the bloodstream to fight an infection. Sepsis occurs wh...","https://www.cottagehealth.org/app/files/public/1714/quality_sepsis_infographic_large.jpg"],
    ["https://ccforum.biomedcentral.com/articles/10.1186/s13054-018-2157-z","The global burden of sepsis: barriers and potential solutions","Sepsis is a major contributor to the global burden of disease. The majority of sepsis cases and deaths are e..","https://www.cottagehealth.org/app/files/public/1715/quality_sepsis_infographic_02.jpg"],
    ["https://www.medicalnewstoday.com/articles/311549.php","How to avoid septic shock","Septic shock is a severe and potentially fatal condition that occurs when sepsis leads to life-threatening low blood pressure. Sepsis develo...","https://www.cdc.gov/vitalsigns/sepsis/images/vs-0816-sepis-fb-twitter.png"],
    ["https://timesofindia.indiatimes.com/life-style/health-fitness/health-news/Personal-hygiene-20-tips-for-better-personal-care/articleshow/17371587.cms","Personal hygiene: 20 tips for better personal care","Good personal hygiene is the first step to good health. It not only protects you from poor health, but also shields those around you from suffering illness...","https://www.who.int/infection-prevention/campaigns/clean-hands/banner2018.jpg?ua=1"],
    ["https://www.wikihow.com/Be-Hygienic","How to Be Hygienic","Managing your personal hygiene is important not only to look and smell your best on a daily basis, but also to preve...","https://bio-arma.com/wp-content/uploads/2016/07/bio-Arma-Medical_Devices-1600x800.jpg"],
    ["https://www.everydayhealth.com/healthy-living/guide-to-good-hygiene.aspx","A Guide to Good Personal Hygiene","Mom was right: Good personal hygiene is essential to promoting good health...","https://c8.alamy.com/comp/HB7HR9/doctor-with-hygenic-surgical-mask-as-sanitary-protection-HB7HR9.jpg"],
    ["https://slideplayer.com/slide/6916070/","The Hygenic Corporation The Active Aging Toolkit For Healthcare Providers Promoting Physical Activity in Older Adults","The Hygenic Corporation The Active Aging Toolkit For Healthcare Providers Promoting Physical Activity in Older Adults...","https://images.slideplayer.com/23/6916070/slides/slide_10.jpg"],
    ["https://www.healthline.com/nutrition/27-health-and-nutrition-tips#section2", "27 Health and Nutrition Tips That Are Actually Evidence-Based", "It’s easy to get confused when it comes to health and nutrition.Even qualified experts often se....", "https://static-news.moneycontrol.com/static-mcnews/2018/10/critical-illness-health-insurance-1280x-720-770x433.jpg"],
    ["https://www.youtube.com/watch?v=4egM_a_nmKk","Top 5 Heart Health Tips","A registered dietitian in Sunnybrook's heart program offers easy heart health tips that ...","https://www.orfonline.org/wp-content/uploads/2019/04/Health-as-a-poll-issue.jpg"],
    ["https://www.webmd.com/balance/features/health-tips-heart-mind-body#1","Women's Health Tips for Heart, Mind, and Body","Looking for the path toward a healthier you? It's not hard to find. The journey begins with some simple tweak...","https://www.studying-in-germany.org/wp-content/uploads/2018/06/health-1.png"],
  ];




  _showArticleCard(idx, pageUrl, title, subtitle, thumbnailUrl){
    return GestureDetector(
          onTap: (){
            launch(pageUrl);
          },
          child: Card(
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
                          "$title",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Text(
                          "$subtitle",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            
                            Spacer(),
                            Text(
                              "Yesterday, 9:24 PM",
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
                ],
              ),
            ),
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
        title: Text("Health Feeds",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        titleSpacing: 10.0,
        
      ),
      body: Container(
        child: ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (context, idx){
            var pageUrl = articleList[idx][0];
            var title = articleList[idx][1];
            var subtitle = articleList[idx][2];
            var thumbnailUrl = articleList[idx][3];
            return _showArticleCard(idx, pageUrl, title, subtitle, thumbnailUrl);
          },
        )
      
      ),
    );
  }
}
