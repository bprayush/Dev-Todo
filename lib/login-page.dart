import 'package:avatar_glow/avatar_glow.dart';
import 'package:devscreening/helpers/delayed-animation.dart';
import 'package:devscreening/helpers/transitions.dart';
import 'package:devscreening/home-page.dart';
import 'package:devscreening/widgets/simple-alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final int _delayedAmount = 500;
  final Color _primaryColour = Colors.grey[100];
  final Color _backgroundColour = Color(0xff001ce2);
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: _backgroundColour,
          body: Center(
            child: Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: _primaryColour,
                        child: FlutterLogo(
                          size: 50.0,
                        ),
                        radius: 50.0,
                      )),
                ),
                DelayedAnimation(
                  child: Text(
                    "Welcome...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: _primaryColour),
                  ),
                  delay: _delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "This is a Flutter test app",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: _primaryColour),
                  ),
                  delay: _delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Recreate as closely as possible.",
                    style: TextStyle(fontSize: 20.0, color: _primaryColour),
                  ),
                  delay: _delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Take note of the animation styles.",
                    style: TextStyle(fontSize: 20.0, color: _primaryColour),
                  ),
                  delay: _delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButton,
                    ),
                  ),
                  delay: _delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => SimpleAlertDialog(
                                message: 'Are you sure you wish to exit?',
                                rightButton: TitleAndAction(
                                    title: 'Exit',
                                    action: () => SystemChannels.platform
                                        .invokeMethod('SystemNavigator.pop')),
                                middleButton: TitleAndAction(
                                    title: 'Cancel',
                                    action: () => Navigator.pop(context)),
                              ));
                      //
                    },
                    child: Text(
                      "I DON'T WANT TO PROCEED",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: _primaryColour),
                    ),
                  ),
                  delay: _delayedAmount + 5000,
                ),
              ],
            ),
          )),
    );
  }

  Widget get _animatedButton => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: _primaryColour,
        ),
        child: Center(
          child: Text(
            'Proceed',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: _backgroundColour,
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    Navigator.of(context)
        .push(slideFromRightTransition(MyHomePage(title: "Flutter Test")));
  }
}
