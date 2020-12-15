import 'package:flutter/material.dart';
import 'count_container.dart';
import 'notification_widget.dart';
import 'event_bus_page.dart';



class DataTransferWidget extends StatelessWidget {
  DataTransferWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CounterPage(),
            NotificationWidget(),
            FirstPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home),text: "InheritedWidget",),
            Tab(icon: Icon(Icons.rss_feed),text: "Notification",),
            Tab(icon: Icon(Icons.perm_identity),text: "EventBus",)
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}