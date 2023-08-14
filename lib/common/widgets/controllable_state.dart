import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/state/lifecycle.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart';

abstract class ControllableState<T extends Lifecycle, V extends StatefulWidget>
    extends State<V> {
  late final T controller;

  @override
  void initState() {
    controller = getIt<T>();
    controller.onInit();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
