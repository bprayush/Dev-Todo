import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/ui/widgets/slidable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoContainer extends StatefulWidget {
  final bool done;
  final Function assign;
  final Function delete;
  final String title;
  final Duration time;

  const TodoContainer({
    Key key,
    this.done = false,
    this.assign,
    this.delete,
    @required this.title,
    @required this.time,
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
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          closeOnScroll: true,
          actions: <Widget>[
            if (!widget.done)
              SlideAction(
                color: AppColors.MEDIUM_GREY,
                onTap: widget.assign,
                child: SlidableButton(
                  icon: FontAwesomeIcons.check,
                  backGroundColor: AppColors.LIGHT_GREEN,
                  color: AppColors.GREEN,
                ),
              ),
          ],
          secondaryActions: <Widget>[
            if (widget.done)
              SlideAction(
                color: AppColors.MEDIUM_GREY,
                onTap: widget.delete,
                child: SlidableButton(
                  icon: FontAwesomeIcons.solidTrashAlt,
                  backGroundColor: AppColors.LIGHT_RED,
                  color: AppColors.RED,
                ),
              ),
          ],
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
                        '${widget.title}',
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
                            fontSize: FontSize.fontSize14,
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
                            fontSize: FontSize.fontSize14,
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
                            fontSize: FontSize.fontSize14,
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
                            fontSize: FontSize.fontSize14,
                            fontWeight: FontWeight.w600,
                            height: ScreenUtil().setHeight(1.5),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                Text(
                  '${widget.time.inHours}hr ${widget.time.inMinutes % 60}m',
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
      ),
    );
  }
}
