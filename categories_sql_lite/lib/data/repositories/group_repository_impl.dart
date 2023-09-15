
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class GroupRepositoryImpl extends GroupsRepository{

  GroupRepositoryImpl(){
    groupsModel = GroupsModel();
  }

  @override
  Future<(int, int)> deleteGroup(Group value) async {
    int? gid = value.gid;
    try {
      if (gid != null) {
        groupsModel.group.remove(value);
        return await DBProvider.db.deleteGroup(gid);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error deleteGroup: $e\n$t');
    }
    throw('Error deleteGroup');
  }

  @override
  Future<bool> getGroups() async {
    try {
      groupsModel.group.addAll(
        await DBProvider.db.getGroups());
      return groupsModel.group.isNotEmpty;
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<void> insertGroup(Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    try{
      groupsModel.group.add(await DBProvider.db.insertGroup(value, conflictAlgorithm:conflictAlgorithm));
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> updateGroup(Group oldValue, Group value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    groupsModel.group.remove(oldValue);
    groupsModel.group.add(value);
    return await DBProvider.db.updateGroup(value, conflictAlgorithm: conflictAlgorithm);
  }

}