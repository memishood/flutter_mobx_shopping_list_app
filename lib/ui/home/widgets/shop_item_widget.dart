import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';
import 'package:intl/intl.dart';

class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget({
    super.key,
    required this.onPressed,
    required this.onLongPressed,
    required this.onChanged,
    required this.item,
    required this.showLeading,
    required this.value,
  });
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final ValueChanged<bool?> onChanged;
  final ShoppingItemEntity item;
  final bool showLeading;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final styles = getIt<TextStyles>();
    return ListTile(
      onTap: onPressed,
      onLongPress: onLongPressed,
      tileColor: item.isDone ? Colors.green.shade100 : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Theme.of(context).splashColor),
      ),
      leading: AnimatedCrossFade(
        crossFadeState:
            showLeading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
        firstChild: Checkbox(
          onChanged: onChanged,
          value: value,
        ),
        secondChild: const SizedBox.shrink(),
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${item.quantity}x',
              style: styles.semiBold.copyWith(fontSize: 16),
            ),
            const WidgetSpan(child: SizedBox(width: 5)),
            TextSpan(text: item.title, style: styles.regular),
          ],
        ),
      ),
      trailing: Text(
        NumberFormat.currency(symbol: '€').format(item.price * item.quantity),
        style: styles.regular.copyWith(fontSize: 16),
      ),
      subtitle: Text(item.description ?? '', style: styles.regular),
    );
  }
}
