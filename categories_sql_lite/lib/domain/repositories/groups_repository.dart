
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class GroupsRepository{

  late AGroupsEntity groupsModel;

  Future<(int, int)> deleteGroup(Group value);

  Future<bool> getGroups();

  Future<void> insertGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateGroup(Group oldValue, Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });


}
