// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_mobx_shopping_list_app/test/ui/home/home_page_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart'
    as _i5;
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart'
    as _i4;
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i2.HomeRepository {
  @override
  _i3.Future<List<_i4.ShoppingItemEntity>> getShoppingItems() =>
      (super.noSuchMethod(
        Invocation.method(
          #getShoppingItems,
          [],
        ),
        returnValue: _i3.Future<List<_i4.ShoppingItemEntity>>.value(
            <_i4.ShoppingItemEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.ShoppingItemEntity>>.value(
                <_i4.ShoppingItemEntity>[]),
      ) as _i3.Future<List<_i4.ShoppingItemEntity>>);
  @override
  _i3.Future<void> deleteShoppingItem(_i4.ShoppingItemEntity? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteShoppingItem,
          [item],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> updateShoppingItem(_i4.ShoppingItemEntity? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShoppingItem,
          [item],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [AlertManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlertManager extends _i1.Mock implements _i5.AlertManager {
  @override
  void info(
    String? message, [
    String? title,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #info,
          [
            message,
            title,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void success(
    String? message, [
    String? title,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #success,
          [
            message,
            title,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void error(
    String? message, [
    String? title,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #error,
          [
            message,
            title,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
