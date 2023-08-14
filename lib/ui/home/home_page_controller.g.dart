// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageController, Store {
  late final _$itemsAtom =
      Atom(name: '_HomePageController.items', context: context);

  @override
  ObservableList<ShoppingItemEntity> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ShoppingItemEntity> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_HomePageController.selected', context: context);

  @override
  ObservableList<ShoppingItemEntity> get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(ObservableList<ShoppingItemEntity> value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_HomePageController._loading', context: context);

  bool get loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  bool get _loading => loading;

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_HomePageController._hasError', context: context);

  bool get hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  bool get _hasError => hasError;

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_hasNetworkErrorAtom =
      Atom(name: '_HomePageController._hasNetworkError', context: context);

  bool get hasNetworkError {
    _$_hasNetworkErrorAtom.reportRead();
    return super._hasNetworkError;
  }

  @override
  bool get _hasNetworkError => hasNetworkError;

  @override
  set _hasNetworkError(bool value) {
    _$_hasNetworkErrorAtom.reportWrite(value, super._hasNetworkError, () {
      super._hasNetworkError = value;
    });
  }

  late final _$multipleSelectAtom =
      Atom(name: '_HomePageController.multipleSelect', context: context);

  @override
  bool get multipleSelect {
    _$multipleSelectAtom.reportRead();
    return super.multipleSelect;
  }

  @override
  set multipleSelect(bool value) {
    _$multipleSelectAtom.reportWrite(value, super.multipleSelect, () {
      super.multipleSelect = value;
    });
  }

  late final _$getShoppingItemsAsyncAction =
      AsyncAction('_HomePageController.getShoppingItems', context: context);

  @override
  Future<void> getShoppingItems() {
    return _$getShoppingItemsAsyncAction.run(() => super.getShoppingItems());
  }

  late final _$deleteSelectedShoppingItemsAsyncAction = AsyncAction(
      '_HomePageController.deleteSelectedShoppingItems',
      context: context);

  @override
  Future<void> deleteSelectedShoppingItems() {
    return _$deleteSelectedShoppingItemsAsyncAction
        .run(() => super.deleteSelectedShoppingItems());
  }

  late final _$toggleAsyncAction =
      AsyncAction('_HomePageController.toggle', context: context);

  @override
  Future<void> toggle(ShoppingItemEntity item) {
    return _$toggleAsyncAction.run(() => super.toggle(item));
  }

  late final _$_HomePageControllerActionController =
      ActionController(name: '_HomePageController', context: context);

  @override
  void selectItem(bool? value, ShoppingItemEntity item) {
    final _$actionInfo = _$_HomePageControllerActionController.startAction(
        name: '_HomePageController.selectItem');
    try {
      return super.selectItem(value, item);
    } finally {
      _$_HomePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
selected: ${selected},
multipleSelect: ${multipleSelect}
    ''';
  }
}
