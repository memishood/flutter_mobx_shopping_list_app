import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';

class RestClient {
  RestClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
      connectTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
  final Dio _dio;

  Future<List<ShoppingItemModel>> getShoppingItems() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/shopping-list.json',
    );
    final data = response.data;

    if (data == null) {
      return List.empty();
    }

    return data.values
        .cast<Map<String, dynamic>>()
        .map(ShoppingItemModel.fromJson)
        .toList();
  }

  Future<void> createShoppingItem(ShoppingItemModel item) async {
    await _dio.put('/shopping-list/${item.id}.json', data: item.toJson());
  }

  Future<void> deleteShoppingItem(ShoppingItemModel item) async {
    await _dio.delete('/shopping-list/${item.id}.json');
  }

  Future<void> updateShoppingItem(ShoppingItemModel item) async {
    await _dio.put('/shopping-list/${item.id}.json', data: item.toJson());
  }
}
