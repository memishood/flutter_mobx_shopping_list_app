import 'package:flutter_mobx_shopping_list_app/data/models/shopping_item_model.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';

class ShoppingItemMapper {
  const ShoppingItemMapper();

  ShoppingItemModel modelFromEntity(ShoppingItemEntity entity) {
    return ShoppingItemModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      price: entity.price,
      quantity: entity.quantity,
      isDone: entity.isDone,
    );
  }

  ShoppingItemEntity entityFromModel(ShoppingItemModel model) {
    return ShoppingItemEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      price: model.price,
      quantity: model.quantity,
      isDone: model.isDone,
    );
  }
}
