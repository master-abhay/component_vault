import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Utils {
  //*------Common Loading Indicators Start------*/

  //*-----Material Loading Indicator-----*/
  static Widget materialLoadingIndicator({dynamic color = Colors.white}) =>
      Center(child: CircularProgressIndicator(color: color, strokeWidth: 1.5));

//*-----Cupertino Loading Indicator-----*/
  static Widget cupertinoLoadingIndicator(
      {dynamic color = Colors.black}) =>
      Center(child: CupertinoActivityIndicator(color: color));

  //*----- page  Loading Indicator-----*/
  static Widget pageLoadingIndicator(
      {dynamic color = Colors.black, required dynamic context}) =>
      Center(
          child: Platform.isAndroid
              ? Utils.materialLoadingIndicator(color: color)
              : Utils.cupertinoLoadingIndicator(color: color));

  //*----- page  Refresh Indicator-----*/
  static Widget pageRefreshIndicator(
      {required dynamic child, required dynamic onRefresh}) =>
      RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.black,
          onRefresh: onRefresh,
          child: ListView(children: [child]));

  // *-----Show Loading more data from server-----*/

  static Widget spinKitThreeBounce() => const Center(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        child: SpinKitThreeBounce(
          color: Colors.black,
          size: 23,
        ),
      ));

//*------Common Loading Indicators End------*/
}
