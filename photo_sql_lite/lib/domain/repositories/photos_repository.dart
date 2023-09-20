
import 'package:photo_sql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class PhotosRepository{

  Future<int> delete(Photo value);

  Future<List<Photo>?> get(int page);

  Future<Photo?> insert(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> update(Photo value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });


}
