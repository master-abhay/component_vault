import 'package:flutter/material.dart';


double get kExtraSmallPadding => 5;
double get kSmallPadding => 10;
double get kPadding => 20;
double get kLargePadding => 30;
Widget get kFormFieldSpace => const SizedBox.square(dimension: 15);
Widget get kSmallSpace => const SizedBox.square(dimension: 10);
Widget get kMediumSpace => const SizedBox.square(dimension: 20);
Widget get kLargeSpace => const SizedBox.square(dimension: 30);
Widget get kShowVoid => const SizedBox.shrink();
double get kCardRadius => 15;
double get kSmallButtonRadius => 4;
double get kButtonRadius => 8;
double get kLargeButtonRadius => 16;
double get kFileCardRadius => 2;
Widget get kFormTitleFieldSpace => const SizedBox.square(dimension: 8);
WidgetStateProperty<Color?> get kDataColumnColor => WidgetStateProperty.resolveWith((state){return Colors.white;});
WidgetStateProperty<Color?> get kDataRowColor => WidgetStateProperty.resolveWith((states) {if (states.contains(WidgetState.selected)) {return Colors.blueGrey;}return Colors.white;});
