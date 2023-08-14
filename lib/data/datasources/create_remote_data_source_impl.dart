import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';

class CreateRemoteDataSourceImpl implements CreateRemoteDataSource {
  const CreateRemoteDataSourceImpl(this._restClient);
  final RestClient _restClient;

  @override
  Future<void> createShoppingItem(ShoppingItemModel item) {
    return _restClient.createShoppingItem(item);
  }
}
