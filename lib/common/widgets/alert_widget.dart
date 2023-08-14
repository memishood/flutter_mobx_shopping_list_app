import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/app/app.dart';
import 'package:flutter_mobx_shopping_list_app/common/extensions/widget_extensions.dart';

class AlertWidget extends MaterialBanner {
  AlertWidget({
    super.key,
    required super.backgroundColor,
    required String title,
    required String message,
  }) : super(
          padding: const EdgeInsets.all(25),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ).paddingOnly(top: 6),
            ],
          ),
          actions: [
            IconButton(
              onPressed: scaffoldKey.currentState?.clearMaterialBanners,
              style: IconButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.white30),
                ),
              ),
              icon: const Icon(Icons.close),
            ),
          ],
        );
}
