import 'package:devscreening/src/assets/assets.dart';
import 'package:devscreening/src/core/viewmodel/todo_view_model.dart';
import 'package:devscreening/src/ui/base_view_widget.dart';
import 'package:devscreening/src/ui/widgets/custom_floating_action_button.dart';
import 'package:devscreening/src/ui/widgets/done_widget.dart';
import 'package:devscreening/src/ui/widgets/todo_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<AnimatedListState> _topListKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _bottomListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<TodoViewModel>(
      builder: (context, model, widget) => Scaffold(
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if ((notification is UserScrollNotification &&
                      notification.direction == ScrollDirection.idle) ||
                  notification is ScrollEndNotification) {
                model.scrollIdle();
              } else {
                model.scrolling();
              }
              return true;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(328),
                  constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setHeight(200),
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: model.topList.length == 0
                        ? DoneWidget()
                        // : ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: model.topList.length,
                        //     physics: BouncingScrollPhysics(),
                        //     itemBuilder: (context, index) {
                        //       return TodoContainer(
                        //         title: model.topList[index].mainText,
                        //         time: model.topList[index].duration,
                        //         done: true,
                        //         delete: () {
                        //           model.delete(index);
                        //         },
                        //       );
                        //     },
                        //   ),
                        : AnimatedList(
                            key: _topListKey,
                            shrinkWrap: true,
                            initialItemCount: model.topList.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: TodoContainer(
                                  title: model.topList[index].mainText,
                                  time: model.topList[index].duration,
                                  done: true,
                                  delete: () {
                                    model.delete(index);
                                    if (_bottomListKey.currentState != null) {
                                      _bottomListKey.currentState.insertItem(
                                        model.bottomList.length - 1,
                                      );
                                    }
                                    if (_topListKey.currentState != null) {
                                      _topListKey.currentState.removeItem(
                                        index,
                                        (context, animation) => SizeTransition(
                                          sizeFactor: animation,
                                        ),
                                        duration: Duration(milliseconds: 300),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
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
                        text: '(${model.bottomList.length})',
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
                    // child: ListView.builder(
                    //   itemCount: model.bottomList.length,
                    //   physics: BouncingScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     return TodoContainer(
                    //       title: model.bottomList[index].mainText,
                    //       time: model.bottomList[index].duration,
                    //       assign: () {
                    //         model.assign(index);
                    //       },
                    //     );
                    //   },
                    // ),
                    child: AnimatedList(
                      key: _bottomListKey,
                      initialItemCount: model.bottomList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: TodoContainer(
                            title: model.bottomList[index].mainText,
                            time: model.bottomList[index].duration,
                            assign: () {
                              model.assign(index);
                              if (_topListKey.currentState != null) {
                                _topListKey.currentState.insertItem(0);
                              }
                              if (_bottomListKey.currentState != null) {
                                _bottomListKey.currentState.removeItem(
                                  index,
                                  (context, animation) => SizeTransition(
                                    sizeFactor: animation,
                                  ),
                                  duration: Duration(milliseconds: 300),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: model.isScrolling
              ? Opacity(
                  opacity: 0.5,
                  child: CustomFloatingActionButton(),
                )
              : CustomFloatingActionButton(),
        ),
      ),
    );
  }
}
