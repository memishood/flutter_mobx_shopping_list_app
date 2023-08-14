// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePageController on _CreatePageController, Store {
  late final _$_savingAtom =
      Atom(name: '_CreatePageController._saving', context: context);

  bool get saving {
    _$_savingAtom.reportRead();
    return super._saving;
  }

  @override
  bool get _saving => saving;

  @override
  set _saving(bool value) {
    _$_savingAtom.reportWrite(value, super._saving, () {
      super._saving = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('_CreatePageController.create', context: context);

  @override
  Future<void> create(
      String title, String description, String price, int quantity) {
    return _$createAsyncAction
        .run(() => super.create(title, description, price, quantity));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
