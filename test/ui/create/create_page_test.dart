import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart'
    as locator;
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:mockito/annotations.dart';

import 'create_page_test.mocks.dart';

@GenerateNiceMocks(
  [MockSpec<CreatePageController>()],
)
void main() {
  late MockCreatePageController controller;

  setUp(() {
    controller = MockCreatePageController();
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.getIt
      ..registerLazySingleton<TextStyles>(TextStyles.new)
      ..registerFactory<CreatePageController>(() => controller);
  });

  testWidgets('Create page renders properly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CreatePage(),
      ),
    );

    expect(
      find.byKey(const Key('create_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('create_page_list_view')),
      findsOneWidget,
    );
    expect(
      find.byType(LottieBuilder),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('create_page_title_text_field')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('create_page_price_text_field')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('create_page_description_text_field')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('create_page_save_button')),
      findsOneWidget,
    );
  });
}
