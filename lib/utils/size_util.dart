import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static ScreenUtil _screenUtil;

  void init(BuildContext context){
    var size = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: size.width, height: size.height);
    _screenUtil = ScreenUtil();
  }

  final double _spToFlutterSizeMultiplier = 1;
  static double _scaleFactor = 1;

  num setWidth(num value) {
    return (_spToFlutterSizeMultiplier * value * _scaleFactor).w;
  }

  num setHeight(num value) {
    return (_spToFlutterSizeMultiplier * value * _scaleFactor).h;
  }

  num setSp(num value) {
    return _screenUtil.setSp(_spToFlutterSizeMultiplier * value * _scaleFactor);
  }
}

extension AppSizeExtension on num {
  ///[ScreenUtil.setWidth]
  num get width => SizeConfig().setWidth(this);

  ///[ScreenUtil.setHeight]
  num get height => SizeConfig().setHeight(this);

  ///[ScreenUtil.setSp]
  num get sp => SizeConfig().setSp(this);
}
