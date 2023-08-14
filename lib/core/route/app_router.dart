import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CreateRoute.page),
      ];
}
