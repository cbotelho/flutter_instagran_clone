import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[_appbar()],
        ),
      ),
    );
  }

  Row _appbar() {
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
          //! onPressed가 null 이면 아이콘이 회색. null이 아니면 활성화된다.
          onPressed: () {},
        ),
      ],
    );
  }
}
