import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';

abstract class CreateRemoteDataSource {
  Future<void> createShoppingItem(ShoppingItemModel item);
}
