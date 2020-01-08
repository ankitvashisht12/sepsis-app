import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {

 var api = 'https://healthfinder.gov/Search.json?api_key=demo_api_key&CategoryID=16';
 var res, posts;
 @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    var decodedResult = jsonDecode(res.body);
    var total = decodedResult["Total"];
    if (total > 0){
      var topics = decodedResult["Topics"];
      var tips = decodedResult["Tools"];
    }

    print(decodedResult.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hi"),
      // child: ListView.builder(
      //   itemBuilder: (_, idx) => {

      //   },
      // ),
    );
  }
}
