import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/extensions/widget_extensions.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart';
import 'package:lottie/lottie.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final styles = getIt<TextStyles>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LottieBuilder.asset(
          'assets/animations/error.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(
          tr('empty_message'),
          style: styles.regular.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        FilledButton.icon(
          onPressed: onPressed,
          icon: const Icon(CupertinoIcons.refresh),
          label: Text(tr('try_again')),
        ).paddingOnly(top: 16),
      ],
    );
  }
}
