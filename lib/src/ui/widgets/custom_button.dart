import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final Function onTap;

  const CustomButton({
    Key key,
    @required this.width,
    @required this.height,
    @required this.color,
    @required this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(
        ScreenUtil().setWidth(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(20),
        ),
        child: Container(
          width: ScreenUtil().setWidth(width),
          height: ScreenUtil().setHeight(height),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: color,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(20),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
