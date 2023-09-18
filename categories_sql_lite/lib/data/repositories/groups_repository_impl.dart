
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class GroupsRepositoryImpl extends GroupsRepository{

  final NetworkInfo networkInfo;
  //if(await networkInfo.isConnected){ <- Для работы с сетью

  GroupsRepositoryImpl({required this.networkInfo});

  @override
  Future<(int, int)> deleteGroup(Group value) async {
    int? gid = value.gid;
    try {
      if (gid != null) {
        return await DBProvider.db.deleteGroup(gid);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error deleteGroup: $e\n$t');
    }
    throw('Error deleteGroup');
  }

  @override
  Future<List<Group>?> getGroups(int page) async {
    try {
       return await DBProvider.db.getGroups(page);
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<Group?> insertGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    try{
      return await DBProvider.db.insertGroup(value, conflictAlgorithm:conflictAlgorithm);
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> updateGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.updateGroup(value, conflictAlgorithm: conflictAlgorithm);
  }

}