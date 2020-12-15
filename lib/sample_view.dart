import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  Widget _getNativeView() {
    print(defaultTargetPlatform);
//使用Android平台的AndroidView，传入唯一标识符sampleView
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'sampleView');
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      //使用iOS平台的UIKitView，传入唯一标识符sampleView
      return UiKitView(viewType: 'sampleView');
    } else {
      return Center(
        child: Text("在手机里试试看"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('里面的那片红是原生绘制的'),
      ),
      body: _getNativeView(),
    );
  }
}
