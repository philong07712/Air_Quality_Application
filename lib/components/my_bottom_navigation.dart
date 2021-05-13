import 'package:air_quality_application/screens/%20history/history_screen.dart';
import 'package:air_quality_application/screens/home/home_screen.dart';
import 'package:air_quality_application/screens/recommend/recommend_screen.dart';
import 'package:air_quality_application/utils/styleguides/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 1;
  final List<Widget> _children = [HistoryScreen(), HomeScreen(), RecommendScreen()];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Container(
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkBlueGradientColor, lightBlueGradientColor])),
        ),
        preferredSize: Size(size.width, 0),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTappedBar,
        index: _currentIndex,
        height: 60,
        backgroundColor: Colors.transparent,
        color: lightBlueGradientColor,
        items: [
          Icon(Icons.stacked_line_chart, size: size.height * 0.04, color: Colors.white,),
          Icon(Icons.home, size: size.height * 0.04, color: Colors.white,),
          Icon(Icons.recommend, size: size.height * 0.04, color: Colors.white,),
        ],
      ),
    );
  }
}

