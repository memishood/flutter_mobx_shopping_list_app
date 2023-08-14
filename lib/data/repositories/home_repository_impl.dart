import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/home_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';
import 'package:flutter_mobx_shopping_list_app/domain/mappers/shopping_item_mapper.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/home_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(
    this._connectionChecker,
    this._shoppingItemMapper,
    this._remote,
  );
  final InternetConnectionChecker _connectionChecker;
  final ShoppingItemMapper _shoppingItemMapper;
  final HomeRemoteDataSource _remote;

  @override
  Future<List<ShoppingItemEntity>> getShoppingItems() async {
    if (await _connectionChecker.hasConnection) {
      final items = await _remote.getShoppingItems();
      return items.map(_shoppingItemMapper.entityFromModel).toList();
    }
    throw NetworkException();
  }

  @override
  Future<void> deleteShoppingItem(ShoppingItemEntity item) async {
    if (await _connectionChecker.hasConnection) {
      return _remote.deleteShoppingItem(
        _shoppingItemMapper.modelFromEntity(item),
      );
    }
    throw NetworkException();
  }

  @override
  Future<void> updateShoppingItem(ShoppingItemEntity item) async {
    if (await _connectionChecker.hasConnection) {
      return _remote.updateShoppingItem(
        _shoppingItemMapper.modelFromEntity(item),
      );
    }
    throw NetworkException();
  }
}
