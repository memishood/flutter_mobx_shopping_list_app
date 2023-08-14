// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemModel _$ShoppingItemModelFromJson(Map<String, dynamic> json) =>
    ShoppingItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$ShoppingItemModelToJson(ShoppingItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'isDone': instance.isDone,
    };
