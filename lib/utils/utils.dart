import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../AppColors.dart';

class Utils {
  //*------Common Loading Indicators Start------*/

  /// Material Loading Indicator
  static Widget materialLoadingIndicator({dynamic color = Colors.white}) =>
      Center(child: CircularProgressIndicator(color: color, strokeWidth: 1.5));

  /// Cupertino Loading Indicator
  static Widget cupertinoLoadingIndicator(
          {dynamic color = AppColors.lightCoral}) =>
      Center(child: CupertinoActivityIndicator(color: color));

  /// Page loading indicator
  static Widget pageLoadingIndicator(
          {dynamic color = AppColors.lightCoral, required dynamic context}) =>
      Center(
          child: Platform.isAndroid
              ? Utils.materialLoadingIndicator(color: color)
              : Utils.cupertinoLoadingIndicator(color: color));

  /// Page Refresh Indicator
  static Widget pageRefreshIndicator(
          {required dynamic child, required dynamic onRefresh}) =>
      RefreshIndicator(
          color: Colors.white,
          backgroundColor: AppColors.lightCoral,
          onRefresh: onRefresh,
          child: ListView(children: [child]));

  /// Spin kit three dots bounce
  static Widget spinKitThreeBounce() => const Center(
          child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        child: SpinKitThreeBounce(
          color: AppColors.lightCoral,
          size: 23,
        ),
      ));

  /// Model Progress Hud
  static Widget modelProgressHud({bool processing = true, dynamic child}) {
    Widget progressIndicator = Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Curved border
        // image: DecorationImage(image: AssetImage("assets/app_logo.jpg"))
      ),
      padding: EdgeInsets.all(10),
      child: Platform.isAndroid
          ? Utils.materialLoadingIndicator(color: AppColors.lightCoral)
          : Utils.cupertinoLoadingIndicator(color: AppColors.lightCoral),
    );
    return ModalProgressHUD(
      color: Colors.blueGrey,
      opacity: 0.3,
      blur: 0.1,
      dismissible: false,
      progressIndicator: progressIndicator,
      inAsyncCall: processing,
      child: child,
    );
  }
//*------Common Loading Indicators End------*/
}
