
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../core/core.dart';

abstract class PhotosRepository{

  Future<int> deleteGroup(User value);

  Future<List<User>?> getGroups(int page);

  Future<User?> insertGroup(User value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateGroup(User value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });


}
