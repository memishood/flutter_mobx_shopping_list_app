import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_shopping_list_app/common/extensions/widget_extensions.dart';
import 'package:flutter_mobx_shopping_list_app/common/widgets/controllable_state.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page_controller.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/widgets/custom_filled_button.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState
    extends ControllableState<CreatePageController, CreatePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'create',
          key: Key('create_page_app_bar_title'),
        ).tr(),
      ),
      body: SafeArea(
        child: ListView(
          key: const Key('create_page_list_view'),
          children: [
            LottieBuilder.asset(
              'assets/animations/items.json',
              height: 200,
            ),
            TextField(
              key: const Key('create_page_title_text_field'),
              controller: _titleController,
              decoration: InputDecoration(labelText: tr('title')),
            ).paddingSymmetric(vertical: 10, horizontal: 20),
            TextField(
              key: const Key('create_page_price_text_field'),
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              decoration: InputDecoration(labelText: tr('price')),
            ).paddingSymmetric(vertical: 10, horizontal: 20),
            TextField(
              key: const Key('create_page_description_text_field'),
              controller: _descriptionController,
              decoration: InputDecoration(labelText: tr('description')),
            ).paddingSymmetric(vertical: 10, horizontal: 20),
            Observer(
              builder: (context) => controller.saving
                  ? const CircularProgressIndicator(
                      key: Key('create_page_loading_indicator'),
                    )
                  : CustomFilledButton(
                      key: const Key('create_page_save_button'),
                      onPressed: (value) {
                        final title = _titleController.text;
                        final description = _descriptionController.text;
                        final price = _priceController.text;
                        controller.create(title, description, price, value);
                      },
                    ),
            ).toCenter().paddingAll(30),
          ],
        ),
      ),
    );
  }
}
