import 'package:flutter/material.dart';

import '../AppColors.dart';


double get kTinyPadding => 2.5;
double get kExtraSmallPadding => 5;
double get kSmallPadding => 10;
double get kMediumPadding => 15;
double get kPadding => 20;
double get kLargePadding => 30;
Widget get kShowVoid => const SizedBox.shrink();
Widget get kMinorSpace => const SizedBox.square(dimension: 2);
Widget get kExtraSmallSpace => const SizedBox.square(dimension: 5);
Widget get kSmallSpace => const SizedBox.square(dimension: 10);
Widget get kMediumSpace => const SizedBox.square(dimension: 15);
Widget get kSpace => const SizedBox.square(dimension: 20);
Widget get kLargeSpace => const SizedBox.square(dimension: 30);
Widget get kExtraLargeSpace => const SizedBox.square(dimension: 50);
double get kTinyCardRadius => 2;
double get kExtraSmallCardRadius => 4;
double get kSmallCardRadius => 10;
double get kCardRadius => 15;
double get kLargeCardRadius => 20;
double get kExtraSmallButtonRadius => 2;
double get kSmallButtonRadius => 4;
double get kButtonRadius => 8;
double get kLargeButtonRadius => 16;
double get kFileCardRadius => 2;
WidgetStateProperty<Color?> get kDataColumnColor => WidgetStateProperty.resolveWith((state){return Colors.white;});
WidgetStateProperty<Color?> get kDataRowColor => WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.selected)) {
    return AppColors.lavenderHaze;
  }
  return Colors.white;  // Default color when no specific state matches
});
