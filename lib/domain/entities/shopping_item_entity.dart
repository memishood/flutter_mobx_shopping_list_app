import 'package:equatable/equatable.dart';

class ShoppingItemEntity extends Equatable {
  const ShoppingItemEntity({
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

  ShoppingItemEntity copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    int? quantity,
    bool? isDone,
  }) {
    return ShoppingItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title, description, price, quantity, isDone];
}
