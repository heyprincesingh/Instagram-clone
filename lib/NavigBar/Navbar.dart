import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'reels.dart';
import 'favorite.dart';
import 'profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final files=[home(),search(),reels(),favorite(),profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: files[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      iconSize: 35,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white24,
      items: [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled,),
            icon: Icon(Icons.home_outlined),
            title: Text("")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_rounded),
            title: Text("")
        ),
        BottomNavigationBarItem(activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border_outlined),
            title: Text("")
        ),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
            title: Text("")
        ),
        ],
        backgroundColor: Colors.black,
        elevation: 20,
        onTap: (context){
          setState(() {
            _currentIndex = context;
          });
        },
      ),
    );
  }
}