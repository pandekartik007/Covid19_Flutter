import '../utils/world.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'screensize.dart';

class CoronaState extends StatelessWidget {
  final String name;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;

  CoronaState({this.name,this.confirmed,this.deaths,this.recovered,this.active});

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Row(
                children: <Widget>[
                  colorCard("Confirmed", confirmed.toString(), context,
                      Color(0xFF8fb9a8)),
                  colorCard("Active", active.toString(), context,
                      Color(0xFFf1828d)),
                ],
              ),
              Row(
                children: <Widget>[
                  colorCard("Deaths", deaths.toString(), context,
                      Color(0xFF765d69)),
                  colorCard("Recovered", recovered.toString(), context,
                      Color(0xFF685d79)),
                ],
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 140.0,
          width: 140.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/app_covid2.png"),
              )),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bgcolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(name),
      ),
      body: bodyWidget(context),
    );
  }
}

Widget colorCard(
    String text, String fields, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 9, right: 9),
    padding: EdgeInsets.all(20.0),
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
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${fields.toString()}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    ),
  );
}
