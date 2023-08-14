import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._restClient);
  final RestClient _restClient;

  @override
  Future<List<ShoppingItemModel>> getShoppingItems() {
    return _restClient.getShoppingItems();
  }

  @override
  Future<void> deleteShoppingItem(ShoppingItemModel item) {
    return _restClient.deleteShoppingItem(item);
  }

  @override
  Future<void> updateShoppingItem(ShoppingItemModel item) {
    return _restClient.updateShoppingItem(item);
  }
}
