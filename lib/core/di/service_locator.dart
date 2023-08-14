import 'package:dio/dio.dart';
import 'package:flutter_mobx_shopping_list_app/common/alert/alert_manager.dart';
import 'package:flutter_mobx_shopping_list_app/common/resources/text_styles.dart';
import 'package:flutter_mobx_shopping_list_app/core/api/rest_client.dart';
import 'package:flutter_mobx_shopping_list_app/core/route/app_router.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source_impl.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source_impl.dart';
import 'package:flutter_mobx_shopping_list_app/data/repositories/create_repository_impl.dart';
import 'package:flutter_mobx_shopping_list_app/data/repositories/home_repository_impl.dart';
import 'package:flutter_mobx_shopping_list_app/domain/mappers/shopping_item_mapper.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/create_repository.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart';
import 'package:flutter_mobx_shopping_list_app/ui/create/create_page_controller.dart';
import 'package:flutter_mobx_shopping_list_app/ui/home/home_page_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

void setUp() {
  setUpCommons();
  setUpHomePage();
  setUpCreatePage();
}

void setUpCommons() {
  getIt
    ..registerSingleton<TextStyles>(
      const TextStyles(),
    )
    ..registerSingleton<AlertManager>(
      const AlertManager(),
    )
    ..registerSingleton<AppRouter>(
      AppRouter(),
    )
    ..registerLazySingleton<InternetConnectionChecker>(
      InternetConnectionChecker.new,
    )
    ..registerLazySingleton<Dio>(
      Dio.new,
    )
    ..registerLazySingleton<RestClient>(
      () => RestClient(getIt()),
    )
    ..registerLazySingleton<ShoppingItemMapper>(
      ShoppingItemMapper.new,
    )
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt(), getIt(), getIt()),
    )
    ..registerLazySingleton<CreateRemoteDataSource>(
      () => CreateRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<CreateRepository>(
      () => CreateRepositoryImpl(getIt(), getIt(), getIt()),
    );
}

void setUpHomePage() {
  getIt.registerFactory<HomePageController>(
    () => HomePageController(getIt(), getIt()),
  );
}

void setUpCreatePage() {
  getIt.registerFactory<CreatePageController>(
    () => CreatePageController(getIt(), getIt()),
  );
}
