
import 'package:photo_sql_lite/core/core.dart';
import 'package:photo_sql_lite/data/data.dart';
import 'package:photo_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class GroupsRepositoryImpl extends PhotosRepository{

  final NetworkInfo networkInfo;
  //if(await networkInfo.isConnected){ <- Для работы с сетью

  GroupsRepositoryImpl({required this.networkInfo});

  @override
  Future<int> deleteGroup(Photo value) async {
    int? gid = value.id;
    try {
      if (gid != null) {
        return await DBProvider.db.delete(gid);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error deleteGroup: $e\n$t');
    }
    throw('Error deleteGroup');
  }

  @override
  Future<List<Photo>?> getGroups(int page) async {
    try {
       return await DBProvider.db.get(page);
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<Photo?> insertGroup(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    try{
      return await DBProvider.db.insert(value, conflictAlgorithm:conflictAlgorithm);
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> updateGroup(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.update(value, conflictAlgorithm: conflictAlgorithm);
  }

}