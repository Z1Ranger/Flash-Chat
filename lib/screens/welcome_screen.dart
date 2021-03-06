import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'transition_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 100,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TransitionBlock(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
                //Go to registration screen.
              },
            ),
            TransitionBlock(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to registration screen.
              },
            ),
          ],
        ),
      ),
    );
  }
}
