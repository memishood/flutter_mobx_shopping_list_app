import 'dart:convert';
import 'dart:io';

import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';

class FixtureManager {
  const FixtureManager();

  T _fixture<T>(String path) {
    final file = File('test/fixtures/responses/$path');
    return jsonDecode(file.readAsStringSync()) as T;
  }

  Map<String, dynamic> get shoppingItemsJson {
    return _fixture<Map<String, dynamic>>('shopping-items-response.json');
  }

  ShoppingItemModel get mockShoppingItemModel => const ShoppingItemModel(
        id: '1',
        title: 'title',
        description: 'description',
        price: 1,
        quantity: 1,
      );

  ShoppingItemEntity get mockShoppingItemEntity => const ShoppingItemEntity(
        id: '1',
        title: 'title',
        description: 'description',
        price: 1,
        quantity: 1,
      );
}
