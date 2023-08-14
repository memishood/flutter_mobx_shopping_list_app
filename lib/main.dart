import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx_shopping_list_app/app/app.dart';
import 'package:flutter_mobx_shopping_list_app/core/di/service_locator.dart'
    as locator;
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await dotenv.load(fileName: 'assets/.env');
  locator.setUp();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
