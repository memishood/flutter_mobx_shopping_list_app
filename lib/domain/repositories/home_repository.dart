import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';

abstract class HomeRepository {
  Future<List<ShoppingItemEntity>> getShoppingItems();

  Future<void> deleteShoppingItem(ShoppingItemEntity item);

  Future<void> updateShoppingItem(ShoppingItemEntity item);
}
