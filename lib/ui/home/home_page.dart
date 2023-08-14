import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_shopping_list_app/common/extensions/widget_extensions.dart';
import 'package:flutter_mobx_shopping_list_app/common/widgets/controllable_state.dart';
import 'package:flutter_mobx_shopping_list_app/common/widgets/empty_widget.dart';
import 'package:flutter_mobx_shopping_list_app/common/widgets/error_widget.dart'
    as error;
import 'package:flutter_mobx_shopping_list_app/common/widgets/network_error_widget.dart';
import 'package:flutter_mobx_shopping_list_app/core/route/app_router.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page_controller.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/widgets/shop_item_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ControllableState<HomePageController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'home',
          key: Key('home_page_app_bar_title'),
        ).tr(),
        actions: [
          Observer(
            builder: (_) => controller.multipleSelect
                ? IconButton(
                    onPressed: controller.deleteSelectedShoppingItems,
                    icon: const Icon(CupertinoIcons.delete),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (controller.loading) {
              return const CircularProgressIndicator(
                key: Key('home_page_loading_indicator'),
              ).toCenter();
            }
            if (controller.hasNetworkError) {
              return NetworkErrorWidget(
                key: const Key('home_page_network_error_widget'),
                onPressed: controller.getShoppingItems,
              ).toCenter();
            }
            if (controller.hasError) {
              return error.ErrorWidget(
                key: const Key('home_page_error_widget'),
                onPressed: controller.getShoppingItems,
              ).toCenter();
            }
            if (controller.items.isEmpty) {
              return const EmptyWidget(
                key: Key('home_page_empty_widget'),
              ).toCenter();
            }
            return ListView.separated(
              key: const Key('home_page_list_view'),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return Observer(
                  builder: (_) => ShopItemWidget(
                    onPressed: () => controller.toggle(item),
                    onLongPressed: () =>
                        controller.multipleSelect = !controller.multipleSelect,
                    onChanged: (v) => controller.selectItem(v, item),
                    item: item,
                    showLeading: controller.multipleSelect,
                    value: controller.selected.contains(item),
                  ),
                );
              },
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemCount: controller.items.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushRoute(const CreateRoute());
          unawaited(controller.getShoppingItems());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
