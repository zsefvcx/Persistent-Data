
import 'package:photo_sql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class PhotosRepository{

  Future<int> deleteGroup(Photo value);

  Future<List<Photo>?> getGroups(int page);

  Future<Photo?> insertGroup(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateGroup(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });


}
