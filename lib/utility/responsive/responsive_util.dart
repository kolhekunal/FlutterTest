import 'package:flutter/material.dart';

class ResponsiveUtil {
  static late double _width;
  static late double _height;
  static late Orientation _orientation;
  static late DeviceType _deviceType;

  void init(BoxConstraints constraints, Orientation orientation) {
    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
      _height = constraints.maxHeight;
    } else {
      _width = constraints.maxHeight;
      _height = constraints.maxWidth;
    }

    if (_width < 600) {
      _deviceType = DeviceType.mobile;
    } else {
      _deviceType = DeviceType.tablet;
    }
  }

  static double height(var i) {
    return _height * i / 100;
  }

  static double width(var i) {
    return _width * i / 100;
  }

  static double sp(var i) {
    return _width / 100 * (i / 3);
  }

  static Orientation get orientation => _orientation;

  static DeviceType get deviceType => _deviceType;
}

enum DeviceType {
  mobile,
  tablet,
}
