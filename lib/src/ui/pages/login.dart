import 'package:devscreening/helpers/delayed-animation.dart';
import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/ui/pages/home.dart';
import 'package:devscreening/src/ui/widgets/custom_button.dart';
import 'package:devscreening/src/ui/widgets/exit_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final int _animationDelay = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(43),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(130),
                height: ScreenUtil().setWidth(130),
                child: FlareActor(
                  'assets/rive/checkmark.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "Untitled",
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              DelayedAnimation(
                delay: _animationDelay,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: FontSize.fontSize24,
                    fontWeight: FontWeight.w300,
                    color: AppColors.CUSTOM_BLACK,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              DelayedAnimation(
                delay: _animationDelay * 2,
                child: Text(
                  'My Todo',
                  style: TextStyle(
                    fontSize: FontSize.fontSize24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.CUSTOM_BLACK,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
              DelayedAnimation(
                delay: _animationDelay * 3,
                child: Text(
                  'My Todo helps you stay organized and perform your tasks much faster',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.fontSize16,
                    color: AppColors.DARK_GREY,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              DelayedAnimation(
                delay: _animationDelay * 4,
                child: CustomButton(
                  width: 202,
                  height: 60,
                  color: AppColors.LIGHT_BLUE,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  child: Text(
                    'Try Demo',
                    style: TextStyle(
                      color: AppColors.DARK_BLUE,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.fontSize16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(24),
              ),
              DelayedAnimation(
                delay: _animationDelay * 5,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return ExitDialog();
                      },
                    );
                  },
                  child: Text(
                    'No thanks',
                    style: TextStyle(
                      color: AppColors.DARK_BLUE,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.fontSize16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
