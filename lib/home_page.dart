import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/screens/feed_screen.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_screen.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_screen_test.dart';

import 'constants/screen_size.dart';

// 위젯은 클래스의 일부
class HomePage extends StatefulWidget {
  HomePage({
    // const는 변할 수 없는 거시기인데 바로 아래  List<BottomNavigationBarItem> btmNavItems 를 넣어서 변할수있음을 보여줘서 에러가 뜬것.  const를 지우자
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];

  int _selectedIndex = 0;

// static 을 쓰면 //?type 'List<dynamic>' is not a subtype of type 'List<Widget>' of 'function result' 라는 에러가 뜬다
  // static List<Widget> _screens = <Widget>[
  List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(color: Colors.blueAccent),
    Container(color: Colors.greenAccent),
    Container(color: Colors.deepPurpleAccent),
    ProfileScreen(),
    // ProfileScreenTest(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;
    return Scaffold(
      // body: _screens[_selectedIndex], //? 이 방식은 screens를 계속 재생성해준다. 넘 안좋지.
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemclick,
      ),
    );
  }

  void _onBtmItemclick(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
