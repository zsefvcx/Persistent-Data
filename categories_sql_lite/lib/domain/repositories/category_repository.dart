
import 'package:categories_sql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class CategoryRepository{
  Future<List<Category>> getAllElementsGroup(int id);
  Future<Category> insertCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });
  Future<int> updateCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });
  Future<int> deleteCategory(int id);
}
