import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'screensize.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IndiaScreen extends StatefulWidget {
  @override
  _IndiaScreenState createState() => _IndiaScreenState();
}

class _IndiaScreenState extends State<IndiaScreen> {
  var jsondata;
  var cases;
  var now = new DateTime.now();
  int total=0;
  int deaths=0;
  int confirmedCasesIndian=0;
  int discharged=0;
  int confirmedCasesForeign=0;
  String s = "https://api.rootnet.in/covid19-in/stats/";
  /*Future<void> getData() async {
    final response = await http.get(s);
    jsondata = json.decode(response.body);
    d = India.fromJson(jsondata);
    setState(() {});
    print(d);
  }*/
  /*Future getData() async{
    var res =  await http.get(s,headers: {'success':'true'});
    var data = json.decode(res.body);
    /*var rest = data['data'];
    list = rest.map<String,dynamic>((json) => Data.fromJson(json)).toList();
    print("Hello");
    print(rest);
    return list;*/
    Data d = Data.fromJson(data);
  }*/
  Future<void> getData() async{
    final response = await http.get(s);
    final Map<String,dynamic> jsonData = json.decode(response.body);
    final Map<String,dynamic> data =jsonData['data'];
    final Map<String,dynamic> sss = data['summary'];
    setState(() {
      total = sss['total'];
      confirmedCasesIndian = sss['confirmedCasesIndian'];
      confirmedCasesForeign = sss['confirmedCasesForeign'];
      discharged = sss['discharged'];
      deaths = sss['deaths'];
    });

    print(total);
  }

  _launchUrl() async{
    const url = 'https://news.abplive.com/news/india';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: total==1
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Fgcolor),
        ),
      )
          : RefreshIndicator(
        onRefresh: getData,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                          "INDIA COVID-19",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[

                        colorCardFirst("Total cases", total.toString(),
                            context, Color(0xFF765d69)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        colorCard("discharged", discharged.toString(),
                            context, Color(0xFF765d69)),
                        colorCard("Deaths", deaths.toString(), context,
                            Color(0xFF685d79)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        colorCard("Foreigners", confirmedCasesForeign.toString(),
                            context, Color(0xFF8fb9a8)),
                        colorCard("Indians", confirmedCasesIndian.toString(),
                            context, Color(0xFFf1828d)),
                      ],
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
                      onPressed: _launchUrl,
                      minWidth: double.infinity,
                      height: 40,
                      child: Text(
                        "LATEST UPDATES".toUpperCase(),
                      ),
                      color: Fgcolor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
        ),
      ),
    );
  }


  Widget colorCard(String text, String f, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 9, right: 9),
      padding: EdgeInsets.all(25),
      height: screenAwareSize(80, context),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${f.toString()}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
  Widget colorCardFirst(String text, String f, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 18, right: 12),
      padding: EdgeInsets.all(25),
      height: screenAwareSize(100, context),
      width: _media.width - 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text.toUpperCase(),
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${f.toString()}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
