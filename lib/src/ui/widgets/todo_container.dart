import 'package:devscreening/src/assets/assets.dart';
import 'package:flutter/material.dart';

class TodoContainer extends StatefulWidget {
  final bool done;

  const TodoContainer({
    Key key,
    this.done = false,
  }) : super(key: key);

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer>
    with SingleTickerProviderStateMixin {
  bool showSubText = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      child: GestureDetector(
        onTap: () {
          setState(() {
            showSubText = !showSubText;
          });
        },
        child: AnimatedContainer(
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
            color: widget.done ? AppColors.LIGHT_GREEN : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                widget.done
                    ? FontAwesomeIcons.solidCheckCircle
                    : FontAwesomeIcons.paperclip,
                color: widget.done ? AppColors.GREEN : AppColors.DARK_BLUE,
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
                    if (showSubText) ...[
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Sub-text 1',
                        style: TextStyle(
                          color: AppColors.CUSTOM_BLACK,
                          fontSize: FontSize.fontSize16,
                          fontWeight: FontWeight.w600,
                          height: ScreenUtil().setHeight(1.5),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Sub-text 2',
                        style: TextStyle(
                          color: AppColors.CUSTOM_BLACK,
                          fontSize: FontSize.fontSize16,
                          fontWeight: FontWeight.w600,
                          height: ScreenUtil().setHeight(1.5),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Sub-text 3',
                        style: TextStyle(
                          color: AppColors.CUSTOM_BLACK,
                          fontSize: FontSize.fontSize16,
                          fontWeight: FontWeight.w600,
                          height: ScreenUtil().setHeight(1.5),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Sub-text 4',
                        style: TextStyle(
                          color: AppColors.CUSTOM_BLACK,
                          fontSize: FontSize.fontSize16,
                          fontWeight: FontWeight.w600,
                          height: ScreenUtil().setHeight(1.5),
                        ),
                      ),
                    ]
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
        ),
      ),
    );
  }
}
