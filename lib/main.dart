import 'package:devscreening/login-page.dart';
import 'package:devscreening/src/locator.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          height: 1920.0,
          width: 1080.0,
        );
        return child;
      },
      home: LoginPage(),
    );
  }
}
