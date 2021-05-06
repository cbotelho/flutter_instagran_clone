import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/widgets/sign_up_form.dart';
import 'package:flutter_instagram_codingpapa/widgets/sign_in_form.dart';

class FadeStack extends StatefulWidget {
  final int selectedForm;

  const FadeStack({Key key, this.selectedForm}) : super(key: key);

  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  AnimationController _animatedController;
  List<Widget> forms = [SignUpForm(), SignInForm()];

  @override
  void initState() {
    // if (currentWidget == null) currentWidget = signUpForm;
    _animatedController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animatedController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(FadeStack oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animatedController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animatedController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
