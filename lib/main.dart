import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/economy.dart';
import 'package:news/screens/health.dart';
import 'package:news/screens/home.dart';
import 'package:news/screens/politics.dart';
import 'package:news/screens/sports.dart';

import 'app_bloc.dart';

void main() => runApp(News());

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  int currentNavBarIndex = 0;
  List<Widget> bottomNavItems = [
    Icon(Icons.home),
    Icon(Icons.directions_run),
    Icon(Icons.healing),
    Icon(Icons.money_off),
    Icon(Icons.people)
  ];

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Sports();
      case 2:
        return Health();
      case 3:
        return Economy();
      case 4:
        return Politics();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF50A8D3),
      ),
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: currentNavBarIndex,
          items: bottomNavItems,
          backgroundColor: Color(0xFF50A8D3),
          onTap: (index) {
            setState(() {
              currentNavBarIndex = index;
            });
          },
          animationDuration: Duration(milliseconds: 400),
        ),
        appBar: AppBar(
          title: StreamBuilder<Object>(
            stream: appBloc.titleStream,
            initialData: "Home",
            builder: (context, snapshot) {
              return Center(child: Text(snapshot.data));
            },
          ),
        ),
        body: getScreen(currentNavBarIndex),
      ),
    );
  }
}
