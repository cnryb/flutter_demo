import 'package:flutter/widgets.dart';

import 'cake.dart';
import 'method_channel.dart';
import 'sample_view.dart';
import 'stack_positioned.dart';
import 'row_expanded.dart';
import 'list_view.dart';
import './data_transfer/main.dart';
import 'json_test.dart';
import 'animaiton.dart';

final Map<String, WidgetBuilder> routes = {
  'listview&简单控件': (context) => ListViewWidget(),
  'row&expanded': (context) => RowExpandedWidget(),
  '层叠布局': (context) => StackPositionedWidget(),
  '自绘控件': (context) => Cake(),
  'data_transfer': (context) => DataTransferWidget(),
  'method_channel': (context) => MethodChannelWidgt(),
  '使用原生绘制的控件': (context) => SampleView(),
  'json_test': (context) => JsonTestWidget(),
  'animaiton': (context) => BuilderAnimateWidget(),
};