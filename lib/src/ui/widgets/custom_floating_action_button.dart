import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      elevation: 0,
      backgroundColor: AppColors.DARK_BLUE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(20),
        ),
      ),
      overlayColor: AppColors.MEDIUM_GREY,
      overlayOpacity: 0.9,
      child: Icon(
        FontAwesomeIcons.plus,
        size: FontSize.fontSize20,
        color: Colors.white,
      ),
      children: speedDialChildrenBuilder(),
    );
  }
}

SpeedDialChild speedDialChildBuilder(String text, IconData icon) {
  return SpeedDialChild(
    backgroundColor: AppColors.EXTRA_LIGHT_BLUE,
    elevation: 0,
    child: Icon(
      icon,
      size: FontSize.fontSize20,
      color: AppColors.DARK_BLUE,
    ),
    labelStyle: TextStyle(
      color: AppColors.CUSTOM_BLACK,
      fontSize: FontSize.fontSize16,
    ),
    labelWidget: Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(10),
      ),
      child: Text(
        '$text',
        style: TextStyle(
          color: AppColors.CUSTOM_BLACK,
          fontSize: FontSize.fontSize16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

List<SpeedDialChild> speedDialChildrenBuilder() {
  return [
    speedDialChildBuilder('New Todo', FontAwesomeIcons.solidCheckCircle),
    speedDialChildBuilder('Add Attachment', FontAwesomeIcons.paperclip),
    speedDialChildBuilder('Set Timer', FontAwesomeIcons.solidClock),
    speedDialChildBuilder('Archive', FontAwesomeIcons.solidFileArchive),
    speedDialChildBuilder('Go to Narnia', FontAwesomeIcons.solidSnowflake),
  ];
}
