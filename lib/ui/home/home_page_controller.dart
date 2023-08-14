import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart';
import 'package:flutter_mobx_shopping_list_app/common/state/lifecycle.dart';
import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store, Lifecycle {
  _HomePageController(
    this._repository,
    this._alert,
  );
  final HomeRepository _repository;
  final AlertManager _alert;

  @observable
  ObservableList<ShoppingItemEntity> items = ObservableList();

  @observable
  ObservableList<ShoppingItemEntity> selected = ObservableList();

  @readonly
  bool _loading = false;

  @readonly
  bool _hasError = false;

  @readonly
  bool _hasNetworkError = false;

  @observable
  bool multipleSelect = false;

  @action
  Future<void> getShoppingItems() async {
    _hasError = false;
    _hasNetworkError = false;
    _loading = true;
    try {
      final data = await _repository.getShoppingItems();
      items = ObservableList.of(data);
    } on NetworkException catch (_) {
      _hasNetworkError = true;
    } catch (err) {
      _hasError = true;
    }
    _loading = false;
  }

  @action
  void selectItem(bool? value, ShoppingItemEntity item) {
    if (value == true) {
      selected.add(item);
    } else {
      selected.remove(item);
    }
  }

  @action
  Future<void> deleteSelectedShoppingItems() async {
    _loading = true;
    try {
      await Future.wait(selected.map(_repository.deleteShoppingItem));
      selected.clear();
      multipleSelect = false;
      return getShoppingItems();
    } on NetworkException catch (_) {
      _alert.error(tr('network_error_message'));
    } catch (err) {
      _alert.error(tr('error_message'));
    }
    _loading = false;
  }

  @action
  Future<void> toggle(ShoppingItemEntity item) async {
    _loading = true;
    try {
      await _repository.updateShoppingItem(item.copyWith(
        isDone: !item.isDone,
      ));
      return getShoppingItems();
    } on NetworkException catch (_) {
      _alert.error(tr('network_error_message'));
    } catch (err) {
      _alert.error(tr('error_message'));
    }
    _loading = false;
  }

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    getShoppingItems();
  }

  @override
  void dispose() {}
}
