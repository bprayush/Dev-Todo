import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/ui/widgets/success_container.dart';
import 'package:devscreening/src/ui/widgets/todo_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MEDIUM_GREY,
      appBar: AppBar(
        backgroundColor: AppColors.MEDIUM_GREY,
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.bars,
          color: AppColors.DARK_GREY,
          size: FontSize.fontSize20,
        ),
        centerTitle: true,
        title: Text(
          'My Todo',
          style: TextStyle(
            color: AppColors.CUSTOM_BLACK,
            fontSize: FontSize.fontSize24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(8.0)),
            child: Icon(
              FontAwesomeIcons.solidBell,
              color: AppColors.DARK_GREY,
              size: FontSize.fontSize20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          left: ScreenUtil().setWidth(24),
          right: ScreenUtil().setWidth(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(328),
              constraints: BoxConstraints(
                maxHeight: ScreenUtil().setHeight(200),
              ),
              child: ListView.builder(
                itemCount: 3,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SuccessContainer();
                },
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Giroy',
                  fontSize: FontSize.fontSize20,
                  color: AppColors.CUSTOM_BLACK,
                ),
                children: [
                  TextSpan(
                    text: 'Remaining Tasks ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '(24)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(12),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().setWidth(328),
                child: ListView.builder(
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoContainer();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
