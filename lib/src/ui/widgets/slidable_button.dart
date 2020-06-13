import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SlidableButton extends StatelessWidget {
  final Color backGroundColor;
  final Color color;
  final Function onTap;
  final IconData icon;

  const SlidableButton({
    Key key,
    @required this.backGroundColor,
    @required this.color,
    this.onTap,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // top: ScreenUtil().setWidth(30),
        bottom: ScreenUtil().setHeight(15),
        left: ScreenUtil().setWidth(15),
        right: ScreenUtil().setWidth(15),
      ),
      child: CustomButton(
        height: ScreenUtil().setHeight(60),
        width: ScreenUtil().setWidth(60),
        onTap: onTap,
        color: backGroundColor,
        child: Icon(
          icon,
          color: color,
          size: FontSize.fontSize20,
        ),
      ),
    );
  }
}
