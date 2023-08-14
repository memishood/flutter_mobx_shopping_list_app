import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart';
import 'package:flutter_mobx_shopping_list_app/common/state/lifecycle.dart';
import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/create_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'create_page_controller.g.dart';

class CreatePageController = _CreatePageController with _$CreatePageController;

abstract class _CreatePageController with Store, Lifecycle {
  _CreatePageController(
    this._repository,
    this._alert,
  );
  final CreateRepository _repository;
  final AlertManager _alert;

  @readonly
  bool _saving = false;

  @action
  Future<void> create(
    String title,
    String description,
    String price,
    int quantity,
  ) async {
    _saving = true;
    try {
      final item = ShoppingItemEntity(
        id: const Uuid().v1(),
        title: title,
        description: description,
        price: double.parse(price),
        quantity: quantity,
      );
      await _repository.createShoppingItem(item);
      _alert.success(tr('created_shopping_item'));
    } on NetworkException catch (_) {
      _alert.error(tr('network_error_message'));
    } catch (err) {
      _alert.error(tr('error_message'));
    } finally {
      _saving = false;
    }
  }

  @override
  void onInit() {}

  @override
  void dispose() {}
}
