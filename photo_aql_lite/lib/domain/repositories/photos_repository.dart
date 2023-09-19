
import 'package:photo_aql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class GroupsRepository{

  Future<int> deleteGroup(Group value);

  Future<List<Group>?> getGroups(int page);

  Future<Group?> insertGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });


}
