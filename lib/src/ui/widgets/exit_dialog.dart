import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/ui/widgets/custom_button.dart';
import 'package:devscreening/src/ui/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      height: 302,
      width: 326,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColors.CUSTOM_BLACK,
                fontSize: FontSize.fontSize24,
                fontFamily: 'Giroy',
              ),
              children: [
                TextSpan(
                  text: 'Confirm ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: 'Quit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(16),
          ),
          Text(
            "Are you sure you don't want to try out this awesome demo?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSize.fontSize16,
              color: AppColors.DARK_GREY,
              height: ScreenUtil().setHeight(1.5),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          CustomButton(
            width: 148,
            height: 60,
            color: AppColors.LIGHT_BLUE,
            onTap: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            child: Text(
              'Yes, Quit Now',
              style: TextStyle(
                color: AppColors.DARK_BLUE,
                fontWeight: FontWeight.w600,
                fontSize: FontSize.fontSize16,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.DARK_BLUE,
                fontWeight: FontWeight.w600,
                fontSize: FontSize.fontSize16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
