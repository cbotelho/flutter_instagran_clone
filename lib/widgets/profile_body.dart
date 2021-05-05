import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/constants/common_size.dart';
import 'package:flutter_instagram_codingpapa/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  // bool selectedLeft = true;
  SelectedTab _selectedTab = SelectedTab.left;

  @override
  Widget build(BuildContext context) {
    // sliverList  는  sliver로 감싼 리스트뷰
    // CustomScrollView는 Expanded로 감싸야한다. 안그러면 안보여 SliverChildListDelegate가 전체를 먹기 때문에.
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _usernBio(),
              _editProfileBtn(), //? CustomScrollView 안에 SliverList로 넣으니까 가로를 꽉 채우는 버튼이 되었다.
              _tabButtons(),
              _selectedIndicator(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 2,
        width: size.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  Row _tabButtons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // spaceAround로 하면 딱 이미지 크기만 터치가 가능하지만 아래처럼
      // Expanded로 감싸면 넓은 범위를 터치할수있게되니 이게 더 좋다.
      children: <Widget>[
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/grid.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.left;
              });
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/saved.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black26
                  : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
              });
            },
          ),
        ),
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        "username",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _usernBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        "This is what I believe!!",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}

enum SelectedTab { left, right }
