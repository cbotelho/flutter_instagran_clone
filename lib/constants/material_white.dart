import 'package:flutter/material.dart';

//* 아래는 colors.dart 에서  red 를 가져온것
// const MaterialColor red = MaterialColor(
//   _redPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFFFEBEE),
//     100: Color(0xFFFFCDD2),
//     200: Color(0xFFEF9A9A),
//     300: Color(0xFFE57373),
//     400: Color(0xFFEF5350),
//     500: Color(_redPrimaryValue),
//     600: Color(0xFFE53935),
//     700: Color(0xFFD32F2F),
//     800: Color(0xFFC62828),
//     900: Color(0xFFB71C1C),
//   },
// );
//
// static const int _redPrimaryValue = 0xFFF44336;
//0xFFF44336  에서 앞의 FF 투명도  나머지는 색깔

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0x1FFFFFFFF),
    100: Color(0x2FFFFFFFF),
    200: Color(0x3FFFFFFFF),
    300: Color(0x4FFFFFFFF),
    400: Color(0x5FFFFFFFF),
    500: Color(0x6FFFFFFFF),
    600: Color(0x7FFFFFFFF),
    700: Color(0x8FFFFFFFF),
    800: Color(0x9FFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
