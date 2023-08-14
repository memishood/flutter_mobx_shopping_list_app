import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart';

class CustomFilledButton extends StatefulWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
  });
  final ValueChanged<int> onPressed;

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final styles = getIt<TextStyles>();
    return FilledButton.icon(
      onPressed: () => widget.onPressed(count),
      icon: const Icon(Icons.add_shopping_cart),
      label: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: tr('save'),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (count > 1) {
                        setState(() => count--);
                      }
                    },
                    iconSize: 19,
                    icon: const Icon(CupertinoIcons.down_arrow),
                  ),
                  Text(
                    count.toString(),
                    style: styles.medium,
                  ),
                  IconButton(
                    onPressed: () => setState(() => count++),
                    iconSize: 19,
                    icon: const Icon(CupertinoIcons.up_arrow),
                  ),
                ],
              ),
            ),
            TextSpan(
              text: tr('item'),
            ),
          ],
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
