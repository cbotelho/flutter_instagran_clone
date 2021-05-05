import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/constants/common_size.dart';
import 'package:flutter_instagram_codingpapa/constants/screen_size.dart';
import 'package:flutter_instagram_codingpapa/widgets/profile_body.dart';

// enum SelectedMenuBar { left, right }
//! 메뉴바 화면 이동 구현 성공
class ProfileScreenTest extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenTest> {
  // SelectedMenuBar _selectedMenuBar = SelectedMenuBar.left;
  //
  bool _selectedMenuBar = false;

  double _animatedMenuMarginLeft = 0;
  double _animatedMenuMarginRight = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(children: [
          // if (_selectedMenuBar == false)
          AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(_animatedMenuMarginLeft, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _appbar(_selectedMenuBar),
                ProfileBody(),
              ],
            ),
          ),
          // if (_selectedMenuBar == true)
          AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform:
                Matrix4.translationValues(_animatedMenuMarginRight, 0, 0),
            child: Container(
              color: Colors.purple,
            ),
          ),
        ]),
      ),
    );
  }

  Row _appbar(bool selected) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
          "The Coding Chan",
          textAlign: TextAlign.center,
        )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // _tabSelected();
            setState(() {
              if (_selectedMenuBar == false) {
                _selectedMenuBar = !_selectedMenuBar;
                _animatedMenuMarginLeft = -size.width + 150;
                _animatedMenuMarginRight = 150;
              } else {
                _selectedMenuBar = !_selectedMenuBar;
                _animatedMenuMarginLeft = 0;
                _animatedMenuMarginRight = size.width;
              }
            });
          },
        ),
      ],
    );
  }

  // _tabSelected() {}
}
