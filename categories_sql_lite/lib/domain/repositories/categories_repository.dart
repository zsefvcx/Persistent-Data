
import 'package:categories_sql_lite/core/core.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class CategoriesRepository{

  Future<int> deleteCategory(Category value);

  Future<List<Category>?> getCategoriesGroup(Group value, int page);

  Future<Category?> insertCategory(Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateCategory(Category oldValue, Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

}
