import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart';
import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'home_page_controller_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<HomeRepository>(),
    MockSpec<AlertManager>(),
  ],
)
void main() {
  late MockHomeRepository repository;
  late MockAlertManager alert;
  late HomePageController controller;

  const fixture = FixtureManager();

  setUp(() {
    repository = MockHomeRepository();
    alert = MockAlertManager();
    controller = HomePageController(repository, alert);
    controller.onInit();
  });

  tearDown(() => controller.dispose());

  group('getShoppingItems()', () {
    test('It should handle NetworkException', () async {
      when(repository.getShoppingItems()).thenThrow(NetworkException());

      await controller.getShoppingItems();

      expect(controller.hasNetworkError, isTrue);
    });

    test('It should handle any Exception', () async {
      when(repository.getShoppingItems()).thenThrow(Exception());

      await controller.getShoppingItems();

      expect(controller.hasError, isTrue);
    });

    test('It should get shopping items', () async {
      when(repository.getShoppingItems()).thenAnswer(
        (_) async => [fixture.mockShoppingItemEntity],
      );

      await controller.getShoppingItems();

      expect(controller.items, isNotEmpty);
      expect(controller.hasError, isFalse);
      expect(controller.hasNetworkError, isFalse);
    });
  });

  group('selectItem()', () {
    test('It should handle when shopping entity is selected', () async {
      controller.selectItem(true, fixture.mockShoppingItemEntity);

      expect(controller.selected, isNotEmpty);
    });

    test('It should handle when shopping entity is un selected', () async {
      controller.selectItem(true, fixture.mockShoppingItemEntity);
      controller.selectItem(false, fixture.mockShoppingItemEntity);

      expect(controller.selected, isEmpty);
    });
  });

  group('deleteSelectedShoppingItems', () {
    test('It should handle NetworkException', () async {
      when(repository.deleteShoppingItem(any)).thenThrow(NetworkException());

      controller.selectItem(true, fixture.mockShoppingItemEntity);
      await controller.deleteSelectedShoppingItems();

      verify(alert.error('network_error_message')).called(1);
    });

    test('It should handle any Exception', () async {
      when(repository.deleteShoppingItem(any)).thenThrow(Exception());

      controller.selectItem(true, fixture.mockShoppingItemEntity);
      await controller.deleteSelectedShoppingItems();

      verify(alert.error('error_message')).called(1);
    });

    test('It should delete selected shopping items', () async {
      when(repository.deleteShoppingItem(any)).thenAnswer((_) async => {});
      when(repository.getShoppingItems()).thenAnswer((_) async => []);

      controller.selectItem(true, fixture.mockShoppingItemEntity);
      await controller.deleteSelectedShoppingItems();

      expect(controller.selected, isEmpty);
      expect(controller.items, isEmpty);
    });
  });

  group('toggle()', () {
    test('It should handle NetworkException', () async {
      when(repository.updateShoppingItem(any)).thenThrow(NetworkException());

      await controller.toggle(fixture.mockShoppingItemEntity);

      verify(alert.error('network_error_message')).called(1);
    });

    test('It should handle any Exception', () async {
      when(repository.updateShoppingItem(any)).thenThrow(Exception());

      await controller.toggle(fixture.mockShoppingItemEntity);

      verify(alert.error('error_message')).called(1);
    });

    test('It should change purchase status of shopping item', () async {
      when(repository.updateShoppingItem(any)).thenAnswer((_) async => {});
      when(repository.getShoppingItems()).thenAnswer((_) async => []);

      await controller.toggle(fixture.mockShoppingItemEntity);

      verify(repository.updateShoppingItem(any)).called(1);
    });
  });
}
