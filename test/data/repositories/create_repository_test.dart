import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/repositories/create_repository_impl.dart';
import 'package:flutter_mobx_shopping_list_app/domain/mappers/shopping_item_mapper.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/create_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'create_repository_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<InternetConnectionChecker>(),
    MockSpec<CreateRemoteDataSource>(),
  ],
)
void main() {
  late MockInternetConnectionChecker connectionChecker;
  late MockCreateRemoteDataSource dataSource;
  late ShoppingItemMapper shoppingItemMapper;
  late CreateRepository repository;

  const fixture = FixtureManager();

  setUp(() {
    connectionChecker = MockInternetConnectionChecker();
    dataSource = MockCreateRemoteDataSource();
    shoppingItemMapper = const ShoppingItemMapper();
    repository = CreateRepositoryImpl(
      connectionChecker,
      shoppingItemMapper,
      dataSource,
    );
  });

  group('createShoppingItem()', () {
    test('CreateRepository should throw NetworkException', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => false);

      expect(
        () => repository.createShoppingItem(fixture.mockShoppingItemEntity),
        throwsA(isA<NetworkException>()),
      );
    });

    test('CreateRepository should create shopping item', () async {
      when(connectionChecker.hasConnection).thenAnswer((_) async => true);

      await repository.createShoppingItem(fixture.mockShoppingItemEntity);

      verify(dataSource.createShoppingItem(any)).called(1);
    });
  });
}
