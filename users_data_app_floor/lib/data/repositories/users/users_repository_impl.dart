




import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';

class UsersRepositoryImpl extends UsersRepository{

  final GetDataUsers getDataUsers;

  UsersRepositoryImpl({required this.getDataUsers});

  @override
  Future<int> delete(User value) async {
    return await getDataUsers.delete(value);
  }

  @override
  Future<List<User>?> get(int page) async {
    return await getDataUsers.get(page);
  }

  @override
  Future<User?> insert(User value) async {
    return await getDataUsers.insert(value);
  }

  @override
  Future<int> update(User value) async {
    return await getDataUsers.update(value);
  }

}