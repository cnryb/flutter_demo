import 'package:flutter/material.dart';

import 'cake.dart';
import 'method_channel.dart';
import 'sample_view.dart';
import 'stack_positioned.dart';
import 'row_expanded.dart';

final Map<String, WidgetBuilder> routes = {
  '自绘控件': (context) => Cake(),
  'method_channel': (context) => MethodChannelWidgt(),
  '使用原生绘制的控件': (context) => SampleView(),
  '层叠布局': (context) => StackPositionedWidget(),
  'row&expanded': (context) => RowExpandedWidget()
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      routes: routes,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  List<Widget> _getMenus(BuildContext context) {
    List<Widget> list = new List<Widget>();
    list.add(DrawerHeader(
      child: Text('菜单'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ));
    routes.forEach((key, value) {
      list.add(ListTile(
        title: Text(key),
        onTap: () {
          Navigator.pushNamed(context, key);
        },
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: _getMenus(context)
            ),
      ),
    );
  }
}
