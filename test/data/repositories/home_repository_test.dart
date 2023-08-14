import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/repositories/home_repository_impl.dart';
import 'package:flutter_mobx_shopping_list_app/domain/mappers/shopping_item_mapper.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'home_repository_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<InternetConnectionChecker>(),
    MockSpec<HomeRemoteDataSource>(),
  ],
)
void main() {
  late MockInternetConnectionChecker connectionChecker;
  late MockHomeRemoteDataSource dataSource;
  late ShoppingItemMapper shoppingItemMapper;
  late HomeRepository repository;

  const fixture = FixtureManager();

  setUp(() {
    connectionChecker = MockInternetConnectionChecker();
    dataSource = MockHomeRemoteDataSource();
    shoppingItemMapper = const ShoppingItemMapper();
    repository = HomeRepositoryImpl(
      connectionChecker,
      shoppingItemMapper,
      dataSource,
    );
  });

  group('getShoppingItems()', () {
    test('It should throw NetworkException', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => false);

      expect(
        () => repository.getShoppingItems(),
        throwsA(isA<NetworkException>()),
      );
    });

    test('It should get shopping items', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => true);
      when(dataSource.getShoppingItems()).thenAnswer(
        (_) async => [fixture.mockShoppingItemModel],
      );

      final items = await repository.getShoppingItems();

      verify(dataSource.getShoppingItems()).called(1);
      expect(items, isNotEmpty);
    });
  });

  group('deleteShoppingItem()', () {
    test('It should throw NetworkException', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => false);

      expect(
        () => repository.deleteShoppingItem(fixture.mockShoppingItemEntity),
        throwsA(isA<NetworkException>()),
      );
    });

    test('It should delete shopping item', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => true);
      when(dataSource.deleteShoppingItem(any)).thenAnswer((_) async => {});

      await repository.deleteShoppingItem(fixture.mockShoppingItemEntity);

      verify(dataSource.deleteShoppingItem(any));
    });
  });

  group('updateShoppingItem()', () {
    test('It should throw NetworkException', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => false);

      expect(
        () => repository.updateShoppingItem(fixture.mockShoppingItemEntity),
        throwsA(isA<NetworkException>()),
      );
    });

    test('It should update shopping item', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => true);
      when(dataSource.updateShoppingItem(any)).thenAnswer((_) async => {});

      await repository.updateShoppingItem(fixture.mockShoppingItemEntity);

      verify(dataSource.updateShoppingItem(any));
    });
  });
}
