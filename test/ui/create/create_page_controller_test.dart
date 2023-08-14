import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart';
import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/create_repository.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_page_controller_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<CreateRepository>(),
    MockSpec<AlertManager>(),
  ],
)
void main() {
  late MockCreateRepository repository;
  late MockAlertManager alert;
  late CreatePageController controller;

  setUp(() {
    repository = MockCreateRepository();
    alert = MockAlertManager();
    controller = CreatePageController(repository, alert);
    controller.onInit();
  });

  tearDown(() => controller.dispose());

  group('create()', () {
    test('It should handle NetworkException', () async {
      when(repository.createShoppingItem(any)).thenThrow(NetworkException());

      await controller.create('title', 'description', '2', 2);

      verify(repository.createShoppingItem(any)).called(1);
      verifyNever(alert.success('created_shopping_item'));
      verify(alert.error('network_error_message')).called(1);
    });

    test('It should handle any Exception', () async {
      when(repository.createShoppingItem(any)).thenThrow(Exception());

      await controller.create('title', 'description', '2', 2);

      verify(repository.createShoppingItem(any)).called(1);
      verifyNever(alert.success('created_shopping_item'));
      verify(alert.error('error_message')).called(1);
    });

    test('It should create shopping item', () async {
      when(repository.createShoppingItem(any)).thenAnswer((_) async => {});

      await controller.create('title', 'description', '2', 2);

      verify(repository.createShoppingItem(any)).called(1);
      verify(alert.success('created_shopping_item')).called(1);
      verifyNever(alert.error(any));
    });
  });
}
