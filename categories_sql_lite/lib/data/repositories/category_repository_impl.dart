
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/db/database.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  @override
  Future<int> deleteCategory(int id) async {
    return await DBProvider.db.deleteCategory(id);
  }

  @override
  Future<List<Category>> getAllElementsGroup(int id) async {
    return await DBProvider.db.getAllElementsGroup(id);
  }

  @override
  Future<Category> insertCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.insertCategory(data, conflictAlgorithm:conflictAlgorithm);
  }

  @override
  Future<int> updateCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.updateCategory(data, conflictAlgorithm: conflictAlgorithm);
  }
}