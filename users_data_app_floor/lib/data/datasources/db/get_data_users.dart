import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/datasources/db/floor/database_floor.dart';

abstract class GetDataUsers{

  Future<int> delete(User value);

  Future<List<User>?> get(int page);

  Future<User?> insert(User value);

  Future<int> update(User value);


}