import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/app/app.dart';
import 'package:flutter_mobx_shopping_list_app/common/widgets/alert_widget.dart';

class AlertManager {
  const AlertManager();

  void info(String message, [String? title]) {
    final widget = AlertWidget(
      backgroundColor: Colors.blueAccent,
      title: title ?? tr('app_name'),
      message: message,
    );
    scaffoldKey.currentState
      ?..clearMaterialBanners()
      ..showMaterialBanner(widget);
  }

  void success(String message, [String? title]) {
    final widget = AlertWidget(
      backgroundColor: Colors.green,
      title: title ?? tr('app_name'),
      message: message,
    );
    scaffoldKey.currentState
      ?..clearMaterialBanners()
      ..showMaterialBanner(widget);
  }

  void error(String message, [String? title]) {
    final widget = AlertWidget(
      backgroundColor: Colors.redAccent,
      title: title ?? tr('app_name'),
      message: message,
    );
    scaffoldKey.currentState
      ?..clearMaterialBanners()
      ..showMaterialBanner(widget);
  }
}
