import 'package:flutter_mobx_shopping_list_app/core/exceptions/network_exception.dart';
import 'package:flutter_mobx_shopping_list_app/data/datasources/create_remote_data_source.dart';
import 'package:flutter_mobx_shopping_list_app/domain/entities/shopping_item_entity.dart';
import 'package:flutter_mobx_shopping_list_app/domain/mappers/shopping_item_mapper.dart';
import 'package:flutter_mobx_shopping_list_app/domain/repositories/create_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CreateRepositoryImpl implements CreateRepository {
  const CreateRepositoryImpl(
    this._connectionChecker,
    this._shoppingItemMapper,
    this._remote,
  );
  final InternetConnectionChecker _connectionChecker;
  final ShoppingItemMapper _shoppingItemMapper;
  final CreateRemoteDataSource _remote;

  @override
  Future<void> createShoppingItem(ShoppingItemEntity item) async {
    if (await _connectionChecker.hasConnection) {
      return _remote.createShoppingItem(
        _shoppingItemMapper.modelFromEntity(item),
      );
    }
    throw NetworkException();
  }
}
