import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Widget toCenter() => Center(child: this);

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double top = 0,
    double left = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}
