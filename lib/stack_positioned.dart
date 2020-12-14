import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackPositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stack & Positioned"),
        ),
        body: Stack(
          children: <Widget>[
            Container(color: Colors.yellow, width: 300, height: 300), //黄色容器​
            Positioned(
              left: 18.0,
              top: 18.0,
              child: Container(
                  color: Colors.green, width: 50, height: 50), //叠加在黄色容器之上的绿色控件​
            ),
            Positioned(
              left: 18.0,
              top: 18.0,
              child: Text("Stack提供了层叠布局的容器"), //叠加在绿色色容器之上的文本​
            )
          ],
        ));
  }
}
