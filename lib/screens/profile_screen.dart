import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/constants/common_size.dart';
import 'package:flutter_instagram_codingpapa/constants/screen_size.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_side_menu.dart';
import 'package:flutter_instagram_codingpapa/widgets/profile_body.dart';

enum MenuStatus { opened, closed }
const duration = Duration(milliseconds: 1000);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final duration = Duration(milliseconds: 300);
  final menuWidth = size.width / 2;

  double bodyXPos = 0;
  double menuXPos = size.width;

  MenuStatus _menuStatus = MenuStatus.closed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(bodyXPos, 0, 0),
              child: ProfileBody(onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.opened
                      : MenuStatus.closed;

                  switch (_menuStatus) {
                    case MenuStatus.opened:
                      bodyXPos = -menuWidth;
                      menuXPos = size.width - menuWidth;
                      break;
                    case MenuStatus.closed:
                      bodyXPos = 0;
                      menuXPos = size.width;
                      break;
                  }
                });
              })),
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            child: Positioned(
              top: 0,
              bottom: 0,
              width: size.width / 2,
              child: ProfileSideMenu(menuWidth),
            ),
          ),
        ],
      ),
    );
  }
}
