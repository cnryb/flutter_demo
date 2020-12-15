import 'package:flutter/widgets.dart';

import 'cake.dart';
import 'method_channel.dart';
import 'sample_view.dart';
import 'stack_positioned.dart';
import 'row_expanded.dart';
import 'list_view.dart';

final Map<String, WidgetBuilder> routes = {
  '自绘控件': (context) => Cake(),
  'method_channel': (context) => MethodChannelWidgt(),
  '使用原生绘制的控件': (context) => SampleView(),
  '层叠布局': (context) => StackPositionedWidget(),
  'row&expanded': (context) => RowExpandedWidget(),
  'listview&简单控件': (context) => ListViewWidget(),
};