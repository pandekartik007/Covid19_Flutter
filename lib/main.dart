import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './screens/globalStats.dart';
import './screens/indiascreen.dart';
import './screens/LandingScreen.dart';
import './screens/statewidescreen.dart';
import './screens/worldlist.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xff272936),
    ),
      home: StartScreen(),
  )
);
class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget> [
    Welcome(),
    Overview(),
    WorldList(),
    IndiaScreen(),
    StateScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff272936),
          boxShadow: [
            BoxShadow(blurRadius: 20,color: Colors.white.withOpacity(0.1))
          ]
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            child: GNav(
              gap: 4,
              activeColor: Colors.white,
              color: Colors.white,
              iconSize: 23,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.insert_chart,
                  text: 'Stats',
                ),
                GButton(
                  icon: Icons.cloud_circle,
                  text: 'World',
                ),
                GButton(
                  icon: Icons.assistant_photo,
                  text: 'India',
                ),
                GButton(
                  icon: Icons.assignment_late,
                  text: 'States',
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
