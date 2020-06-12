import 'package:devscreening/model/app-types.dart';
import 'package:devscreening/widgets/detail-list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ListSwapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Slide panel left to reveal button',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Visibility(
              visible: appState.topList.length == 0,
              child: Container(
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text("I'm sad.  :-( Add something here!"),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 200.0,
              ),
              child: ListView(
                shrinkWrap: true,
                children: appState.topList
                    .map(
                      (e) => DetailListItem(
                        panelData: e,
                        canAssign: false,
                        canRemove: true,
                        panelColour: Colors.green,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Slide panel right to reveal button',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    //AppScaffoldState s = Provider.of<AppScaffoldState>( context, listen: false );
                    bool isScrolling =
                        (notification is UserScrollNotification &&
                                    notification.direction ==
                                        ScrollDirection.idle) ||
                                notification is ScrollEndNotification
                            ? false
                            : true;

                    appState.isScrolling = isScrolling;

                    return true;
                  },
                  child: ListView(
                    children: appState.bottomList
                        .map(
                          (e) => DetailListItem(
                            panelData: e,
                            canAssign: true,
                            canRemove: false,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
