import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用Android平台的AndroidView，传入唯一标识符sampleView
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'sampleView');
    } else {
      //使用iOS平台的UIKitView，传入唯一标识符sampleView
      return UiKitView(viewType: 'sampleView');
    }
  }
}
