import 'package:flutter/material.dart';
import '../services/caution.dart';
import 'screensize.dart';
import 'helpline.dart';
import '../utils/colors.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  /*Animation virusBounce;
  Animation shadowFade;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward(from: 0.0);
        }
      });
    virusBounce = Tween(begin: Offset(0, 0), end: Offset(0, -20.0))
        .animate(animationController);
    shadowFade = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0), parent: animationController));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Image(
                    alignment: Alignment.center,
                    image: AssetImage("assets/app_covid.png"),
                    height: screenAwareSize(350, context),
                    width: screenAwareSize(350, context),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Center(
                  child: Text(
                    'COVID-19',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cautions()),
                    );
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Precautions'.toUpperCase(),
                  ),
                  color: Fgcolor,
                  textColor: Colors.white,
                ),
                SizedBox(height: 5),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'HelpLine'.toUpperCase(),
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
}
