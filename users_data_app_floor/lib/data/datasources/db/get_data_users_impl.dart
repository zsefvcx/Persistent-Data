
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';

import 'database_sqflite.dart';

class GetDataUsersImpl extends GetDataUsers {

  final dbType = DebugData.dbType;

  //final Map<int, User>  mapUserModel =  {};

  @override
  Future<int> delete(User value) async {
    int? gid = value.id;
    try {
      if (gid != null) {
        if(dbType == DBType.sqflite) {
          return await DBProvider.db.delete(gid);
        } else {
          throw('not implemented');
        }
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error deleteGroup: $e\n$t');
    }
    throw('Error deleteGroup');
  }

  @override
  Future<List<User>?> get(int page) async {
    try {
      if(dbType == DBType.sqflite) {
        return await DBProvider.db.get(page);
      } else {
        throw('not implemented');
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<User?> insert(User value) async {
    try{
      if(dbType == DBType.sqflite) {
        return await DBProvider.db.insert(value);
      } else if (dbType == DBType.floor) {

      } else {
        throw('not implemented');
      }
    } catch(e,t){
    Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
    throw('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> update(User value) async {
    if(dbType == DBType.sqflite) {
      return await DBProvider.db.update(value);
    } else {
      throw('not implemented');
    }
  }

}
