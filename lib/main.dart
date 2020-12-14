import 'package:flutter/material.dart';

import 'cake.dart';
import 'method_channel.dart';
import 'sample_view.dart';
import 'stack_positioned.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Demo';

  final Map<String, WidgetBuilder> routes = {
    '自绘控件': (context) => Cake(),
    'method_channel': (context) => MethodChannelWidgt(),
    'sample_view': (context) => SampleView(),
    'stack_positioned': (context) => StackPositionedWidget(),
  };

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
          children: <Widget>[
            DrawerHeader(
              child: Text('菜单'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('自绘控件'),
              onTap: () {
                Navigator.pushNamed(context, '自绘控件');
              },
            ),
            ListTile(
              title: Text('method channel'),
              onTap: () {
                Navigator.pushNamed(context, 'method_channel');
              },
            ),
            ListTile(
              title: Text('使用原生绘制的控件'),
              onTap: () {
                Navigator.pushNamed(context, 'sample_view');
              },
            ),
            ListTile(
              title: Text('层叠布局'),
              onTap: () {
                Navigator.pushNamed(context, 'stack_positioned');
              },
            ),
          ],
        ),
      ),
    );
  }
}
