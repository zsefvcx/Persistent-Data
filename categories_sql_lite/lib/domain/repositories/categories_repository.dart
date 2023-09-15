
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class CategoriesRepository{

  late ACategoriesEntity categoriesModel;

  Future<int> deleteCategory(Category value);

  Future<bool> getAllElementsGroup(Group value);

  Future<void> insertCategory(Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

  Future<int> updateCategory(Category oldValue, Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });

}
