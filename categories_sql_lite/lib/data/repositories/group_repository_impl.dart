
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/db/database.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class GroupRepositoryImpl extends GroupRepository{
  @override
  Future<(int, int)> deleteGroup(int gid) async {
    return await DBProvider.db.deleteGroup(gid);
  }

  @override
  Future<List<Group>> getGroups() async {
    return await DBProvider.db.getGroups();
  }

  @override
  Future<Group> insertGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.insertGroup(data, conflictAlgorithm:conflictAlgorithm);
  }

  @override
  Future<int> updateGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.updateGroup(data, conflictAlgorithm: conflictAlgorithm);
  }

}