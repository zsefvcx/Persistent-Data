
import 'package:categories_sql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class GroupRepository{
  Future<List<Group>> getGroups();
  Future<Group> insertGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });
  Future<int> updateGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });
  Future<(int, int)> deleteGroup(int gid);
}
