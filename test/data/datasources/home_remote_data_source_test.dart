import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'home_remote_data_source_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<RestClient>(),
  ],
)
void main() {
  late MockRestClient restClient;
  late HomeRemoteDataSource dataSource;

  const fixture = FixtureManager();

  setUp(() {
    restClient = MockRestClient();
    dataSource = HomeRemoteDataSourceImpl(restClient);
  });

  group('getShoppingItems()', () {
    test('HomeRemoteDataSource should get shopping items', () async {
      when(restClient.getShoppingItems()).thenAnswer(
        (_) async => [fixture.mockShoppingItemModel],
      );

      final shoppingItems = await dataSource.getShoppingItems();

      verify(restClient.getShoppingItems()).called(1);
      expect(shoppingItems, isNotEmpty);
    });
  });

  group('deleteShoppingItem()', () {
    test('HomeRemoteDataSource should delete shopping item', () async {
      when(restClient.deleteShoppingItem(any)).thenAnswer(
        (_) => Future.value(),
      );

      await dataSource.deleteShoppingItem(fixture.mockShoppingItemModel);

      verify(
        restClient.deleteShoppingItem(
          fixture.mockShoppingItemModel,
        ),
      ).called(1);
    });
  });

  group('updateShoppingItem()', () {
    test('HomeRemoteDataSource should update shopping item', () async {
      when(restClient.updateShoppingItem(any)).thenAnswer(
        (_) => Future.value(),
      );

      await dataSource.updateShoppingItem(fixture.mockShoppingItemModel);

      verify(
        restClient.updateShoppingItem(
          fixture.mockShoppingItemModel,
        ),
      ).called(1);
    });
  });
}
