
import 'package:users_data_app_floor/core/core.dart';

abstract class UsersRepository{

  Future<int> delete({required User value});

  Future<List<User>?> get({required int page});

  Future<User?> insert({required User value});

  Future<int> update({required User value});


}
