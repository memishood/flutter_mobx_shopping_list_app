import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'rest_client_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<Dio>(),
  ],
)
void main() {
  setUpAll(() async {
    await dotenv.load(fileName: 'assets/.env');
  });

  const fixture = FixtureManager();

  late MockDio dio;
  late RestClient restClient;

  setUp(() {
    dio = MockDio();
    restClient = RestClient(dio);

    when(dio.put(any, data: anyNamed('data'))).thenAnswer(
      (_) async => Response(requestOptions: RequestOptions()),
    );
    when(dio.delete(any)).thenAnswer(
      (_) async => Response(requestOptions: RequestOptions()),
    );
  });

  group('getShoppingItems()', () {
    test(
      'RestClient should return empty list when response data is null',
      () async {
        when(dio.get<Map<String, dynamic>>('/shopping-list.json')).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(), data: null),
        );

        final response = await restClient.getShoppingItems();

        expect(response, isEmpty);
      },
    );

    test(
      'RestClient should return data list when response data exists',
      () async {
        when(dio.get<Map<String, dynamic>>('/shopping-list.json')).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: fixture.shoppingItemsJson,
          ),
        );

        final response = await restClient.getShoppingItems();

        expect(response, isNotEmpty);
      },
    );
  });

  group('createShoppingItem', () {
    test('RestClient should insert new shopping item', () async {
      await restClient.createShoppingItem(fixture.mockShoppingItemModel);

      verify(
        dio.put(
          '/shopping-list/${fixture.mockShoppingItemModel.id}.json',
          data: fixture.mockShoppingItemModel.toJson(),
        ),
      ).called(1);
    });
  });

  group('deleteShoppingItem()', () {
    test('RestClient should delete shopping item', () async {
      await restClient.deleteShoppingItem(fixture.mockShoppingItemModel);

      verify(
        dio.delete(
          '/shopping-list/${fixture.mockShoppingItemModel.id}.json',
        ),
      ).called(1);
    });
  });

  group('updateShoppingItem()', () {
    test('RestClient should update shopping item', () async {
      await restClient.updateShoppingItem(fixture.mockShoppingItemModel);

      verify(
        dio.put(
          '/shopping-list/${fixture.mockShoppingItemModel.id}.json',
          data: fixture.mockShoppingItemModel.toJson(),
        ),
      ).called(1);
    });
  });
}
