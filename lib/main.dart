import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/assets/screen_size.dart';
import 'package:devscreening/src/locator.dart';
import 'package:devscreening/src/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev TODO',
      theme: ThemeData(
        primaryColor: AppColors.DARK_BLUE,
        fontFamily: 'Giroy',
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          height: ScreenSize.HEIGHT,
          width: ScreenSize.WIDTH,
        );
        return child;
      },
      home: LoginPage(),
    );
  }
}
