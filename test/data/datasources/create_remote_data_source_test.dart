import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'create_remote_data_source_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<RestClient>(),
  ],
)
void main() {
  late MockRestClient restClient;
  late CreateRemoteDataSource dataSource;

  const fixture = FixtureManager();

  setUp(() {
    restClient = MockRestClient();
    dataSource = CreateRemoteDataSourceImpl(restClient);
  });

  group('createShoppingItem()', () {
    test('CreateRemoteDataSource should create shopping item', () async {
      await dataSource.createShoppingItem(fixture.mockShoppingItemModel);

      verify(
        restClient.createShoppingItem(
          fixture.mockShoppingItemModel,
        ),
      ).called(1);
    });
  });
}
