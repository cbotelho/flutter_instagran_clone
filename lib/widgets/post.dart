import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/constants/common_size.dart';
import 'package:flutter_instagram_codingpapa/widgets/comment.dart';
import 'package:flutter_instagram_codingpapa/widgets/my_progress_indicator.dart';
import 'package:flutter_instagram_codingpapa/widgets/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;
  Size size;
  // 위애 size 변수를 선언한 순간 이건 변하는 값이라서 아래 const에서 에러가 나게된다. ... const를 지운다
  // const Post(
  Post(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.accents[index % Colors.accents.length],
    //   height: 100,
    // );

    if (size == null) size = MediaQuery.of(context).size;

    //? 이 캐쉬네트워크 이미지는 우리가 다운받은 이미지들을 저장해놓아서 효율적. 한마디로 캐쉬를 사용.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: Comment(
        showImage: false,
        username: 'testingUser',
        text: 'money~',
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

//?  TextSpan은 ThemeData의 primarySwatch의 색을 따라가. 따로 지정해줘야돼
  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/comment.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(AssetImage('assets/images/heart_selected.png')),
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('username')),
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
            onPressed: null)
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      // 끝애 200/300 은 가로/세로   200/200 으로 바꾸자.
      imageUrl:
          'https://picsum.photos/id/$index/2000/2000', // lorem picsum에서 가져옴
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(
          containerSize: size.width,
        );
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1, // width /height 비율. 1:1의 비율로 넣어주겠다.
          child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}

// class MyProgressIndicator extends StatelessWidget {
//   const MyProgressIndicator({
//     Key key,
//     @required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: size.width,
//         height: size.height,
//         child: Center(
//             child: SizedBox(
//                 height: 60,
//                 width: 60,
//                 child: CircularProgressIndicator(
//                   backgroundColor: Colors.black87,
//                 ))));
//   }
// }
