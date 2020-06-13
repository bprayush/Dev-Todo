import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: ScreenUtil().setWidth(327),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(16),
      ),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(20),
        horizontal: ScreenUtil().setWidth(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.paperclip,
            color: AppColors.DARK_BLUE,
            size: FontSize.fontSize20,
          ),
          Container(
            width: ScreenUtil().setWidth(188),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Complete Flutter UI App challenge and upload it on Github',
                  style: TextStyle(
                    color: AppColors.CUSTOM_BLACK,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontWeight.w600,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '1hr 25m',
            style: TextStyle(
              color: AppColors.DARK_GREY,
              fontSize: FontSize.fontSize14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
