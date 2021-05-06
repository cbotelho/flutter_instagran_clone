import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/screens/camera_screen.dart';
import 'package:flutter_instagram_codingpapa/screens/feed_screen.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_screen.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_screen_test.dart';
import 'package:permission_handler/permission_handler.dart';

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
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

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
      key: _key,
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
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        }
    }
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context))
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CameraScreen()));
    else {
      SnackBar snackBar = SnackBar(
        content: Text('사진, 파일, 마이크 접근 허용을 해주셔야 카메라 사용이 가능합니다.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Scaffold.of(context).hideCurrentSnackBar();
            _key.currentState.hideCurrentSnackBar();
            AppSettings.openAppSettings();
          },
        ),
      );
      // Scaffold.of(context).showSnackBar(snackBar);
      _key.currentState.showSnackBar(snackBar);
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.microphone].request();
    bool permitted = true;

    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });

    return permitted;
  }
}
