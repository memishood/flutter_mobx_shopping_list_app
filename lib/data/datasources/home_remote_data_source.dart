import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ShoppingItemModel>> getShoppingItems();

  Future<void> deleteShoppingItem(ShoppingItemModel item);

  Future<void> updateShoppingItem(ShoppingItemModel item);
}
