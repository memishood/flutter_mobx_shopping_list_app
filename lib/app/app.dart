import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart';
import 'package:flutter_mobx_shopping_list_app/core/route/app_router.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = getIt<AppRouter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldKey,
      onGenerateTitle: (context) => tr('app_name'),
      theme: ThemeData.light(useMaterial3: true),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: _appRouter.config(),
    );
  }
}
