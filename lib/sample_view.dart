import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  
  Widget _getNativeView(){
//使用Android平台的AndroidView，传入唯一标识符sampleView
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'sampleView');
    } else {
      //使用iOS平台的UIKitView，传入唯一标识符sampleView
      return UiKitView(viewType: 'sampleView');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('里面的那片红是原生绘制的'),),
      body: _getNativeView(),
    );
  }
}
