import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'routes.dart';

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

  Widget _getDownloadLink(){
    if(kIsWeb == true){
      return Center(child: RaisedButton(child: Text('安卓App下载'),
      onPressed: () {
        launch("/app-release.apk");
      },));
    }else{
      return Center(child: Text('My Page!'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _getDownloadLink(),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: _getMenus(context)
            ),
      ),
    );
  }
}
