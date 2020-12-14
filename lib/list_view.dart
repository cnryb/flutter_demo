import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _ListViewWidgetState();
  }
}

class _ListViewWidgetState extends State<ListViewWidget>
{
  String txt = "这个是文本内容";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView(
        children: [
          Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                txt = value;
              });
            },
          ),
          Image.network("https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/6b/4c/26/6b4c267e-8360-16c9-d019-c0b2fe013cad/AppIcon-0-0-1x_U007emarketing-0-0-0-9-0-85-220.png/246x0w.png"),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () {
              setState(() {
                txt = "FlatButton Pressed";
              });
            },
          )
        ],
      ),
    );
  }

  
}
