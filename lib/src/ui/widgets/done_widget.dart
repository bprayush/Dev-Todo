import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';

class DoneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(327),
      height: ScreenUtil().setHeight(60),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidCheckCircle,
              color: AppColors.GREEN,
            ),
            Text(
              'Nothing to see here... move on...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.fontSize16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
