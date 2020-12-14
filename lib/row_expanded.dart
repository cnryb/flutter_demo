import 'package:flutter/material.dart';

class RowExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row&Expanded"),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            width: 60,
            height: 80,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 180,
          ),
          Container(
            color: Colors.green,
            width: 60,
            height: 80,
          ),
          Expanded(
            child: Container(color: Colors.cyan, height: 60),
          )
        ],
      ),
    );
  }
}
