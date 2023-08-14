import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';

abstract class CreateRepository {
  Future<void> createShoppingItem(ShoppingItemEntity item);
}
