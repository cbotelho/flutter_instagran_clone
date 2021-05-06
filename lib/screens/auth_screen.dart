import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/screens/profile_screen.dart';
import 'package:flutter_instagram_codingpapa/widgets/sign_up_form.dart';
import 'package:flutter_instagram_codingpapa/widgets/sign_in_form.dart';
import 'package:flutter_instagram_codingpapa/widgets/fade_stack.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Widget signUpForm = SignUpForm();
  // Widget signInForm = SignInForm();
  // Widget currentWidget;

  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 기본값 true  바텀쪽에 있는 것들이 키보드올릴때 안올라오도록.
      // 근데 아래쪽에 중요한 것이 있으면? -> 해당 화면도 resizeToAvoidBottomInset를 쓰고 true로 해준다.
      body: SafeArea(
        child: Stack(children: [
          //? 아래 와 같은 방식으로 하고 싶지 않고 커스텀애니메이션을 만들고 싶다면
          //? AnimatedSwitcher안에 transitionBuilder라고 있다.
          // AnimatedSwitcher(
          //   duration: duration,
          //   child: currentWidget,
          //   )
          FadeStack(
            selectedForm: selectedForm,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 40,
            child: Container(
              color: Colors.white,
              child: FlatButton(
                shape: Border(top: BorderSide(color: Colors.grey)),
                onPressed: () {
                  setState(() {
                    // if (currentWidget is SignUpForm) {
                    //   currentWidget = signInForm;
                    // } else {
                    //   currentWidget = signUpForm;
                    // }
                    if (selectedForm == 0) {
                      selectedForm = 1;
                    } else {
                      selectedForm = 0;
                    }
                  });
                },
                child: RichText(
                  text: TextSpan(
                      text: (selectedForm == 0)
                          ? "Aleady have an account? "
                          : "don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: (selectedForm == 0) ? "Sign In" : "Sign Up",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
