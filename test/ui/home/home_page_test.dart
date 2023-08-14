import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart'
    as locator;
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_manager.dart';
import 'home_page_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<HomePageController>(),
  ],
)
void main() {
  late MockHomePageController controller;

  const fixture = FixtureManager();

  setUp(() {
    controller = MockHomePageController();
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.getIt
      ..registerLazySingleton<TextStyles>(TextStyles.new)
      ..registerFactory<HomePageController>(() => controller);
  });

  testWidgets('Home page renders loading state', (tester) async {
    when(controller.loading).thenReturn(true);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(
      find.byKey(const Key('home_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('home_page_loading_indicator')),
      findsOneWidget,
    );
  });

  testWidgets('Home page renders empty state', (tester) async {
    when(controller.items).thenReturn(mobx.ObservableList.of([]));

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(
      find.byKey(const Key('home_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('home_page_empty_widget')),
      findsOneWidget,
    );
  });

  testWidgets('Home page renders network error state', (tester) async {
    when(controller.hasNetworkError).thenReturn(true);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(
      find.byKey(const Key('home_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('home_page_network_error_widget')),
      findsOneWidget,
    );
  });

  testWidgets('Home page renders any error state', (tester) async {
    when(controller.hasError).thenReturn(true);

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(
      find.byKey(const Key('home_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('home_page_error_widget')),
      findsOneWidget,
    );
  });

  testWidgets('Home page renders shopping items', (tester) async {
    when(controller.selected).thenReturn(mobx.ObservableList.of([]));
    when(controller.items).thenReturn(
      mobx.ObservableList.of([fixture.mockShoppingItemEntity]),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(
      find.byKey(const Key('home_page_app_bar_title')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('home_page_list_view')),
      findsOneWidget,
    );
  });
}
