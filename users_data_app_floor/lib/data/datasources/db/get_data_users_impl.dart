
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';

import 'database_sqflite.dart';
import 'floor/database_floor.dart';

class GetDataUsersImpl extends GetDataUsers  {

  final dbType = DebugData.dbType;
  //final AppDatabase appDatabase = AppDatabase();
  //final Map<int, User>  mapUserModel =  {};
  UserDao? dao;

  Future<void> _initDataBaseFloor() async {
    final database = await $FloorAppDatabase
        .databaseBuilder('users_database.db')
        .build();
    dao = database.userDao;
  }


  @override
  Future<User?> insert(User value) async {
    try{
      if(dbType == DBType.sqflite) {
        return await DBProvider.db.insert(value);
      } else if (dbType == DBType.floor) {
        if(dao == null) await _initDataBaseFloor();
        final UserDao? daoLocal = dao;
        if(daoLocal !=null) {
          int id = await daoLocal.insertUser(value);
          return value.copyWith(
            id: id,
          );
        }
        throw('Error insertGroup');
    } else {
    throw('not implemented');
    }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> delete(User value) async {
    int? gid = value.id;
    try {
      if (gid != null) {
        if(dbType == DBType.sqflite) {
          return await DBProvider.db.delete(gid);
        } else if (dbType == DBType.floor) {
          if(dao == null) await _initDataBaseFloor();
          final UserDao? daoLocal = dao;
          if(daoLocal !=null) {
            return await daoLocal.deleteUser(value);
          }
          throw('Error insertGroup');
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
      } else if (dbType == DBType.floor) {
        if(dao == null) await _initDataBaseFloor();
        final UserDao? daoLocal = dao;
        if(daoLocal !=null) {
          return await daoLocal.get();
        }
        throw('Error insertGroup');
      } else {
        throw('not implemented');
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<int> update(User value) async {
    try {
      if (dbType == DBType.sqflite) {
        return await DBProvider.db.update(value);
      } else if (dbType == DBType.floor) {
        if (dao == null) await _initDataBaseFloor();
        final UserDao? daoLocal = dao;
        if (daoLocal != null) {
          return await daoLocal.updateUser(value);
        }
        throw('Error insertGroup');
      } else {
        throw('not implemented');
      }
    } catch (e, t) {
      throw('Error insertGroup: $e\n$t');
    }
  }

}
