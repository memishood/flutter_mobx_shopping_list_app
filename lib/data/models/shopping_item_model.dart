import 'package:json_annotation/json_annotation.dart';

part 'shopping_item_model.g.dart';

@JsonSerializable()
class ShoppingItemModel {
  const ShoppingItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    this.isDone = false,
  });

  final String id;
  final String title;
  final String? description;
  final double price;
  final int quantity;
  final bool isDone;

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingItemModelToJson(this);
}
