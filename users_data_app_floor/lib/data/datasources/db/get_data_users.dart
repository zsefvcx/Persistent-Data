import 'package:users_data_app_floor/core/core.dart';

abstract class GetDataUsers{

  Future<int> delete(User value);

  Future<List<User>?> get(int page);

  Future<User?> insert(User value);

  Future<int> update(User value);

}
