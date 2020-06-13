import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const CustomDialog({
    Key key,
    @required this.width,
    @required this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(20),
        ),
      ),
      child: Container(
        height: ScreenUtil().setHeight(height),
        width: ScreenUtil().setWidth(width),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(37),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(20),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: ScreenUtil().setWidth(30),
              color: AppColors.LIGHT_GREY,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
