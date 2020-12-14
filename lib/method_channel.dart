import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const platfrom = MethodChannel('samples.cnryb.com/methodChannel');

class MethodChannelWidgt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelWidgtState();
  }
}

class _MethodChannelWidgtState extends State<MethodChannelWidgt>{
  String btnName = "sayHi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("method channel"),),
      body: RaisedButton(
        child: Text(btnName),
        onPressed: () async {
          try {
            var res = await platfrom.invokeMethod('sayHello');
            setState(() {
              btnName = res;
            });
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
  
}