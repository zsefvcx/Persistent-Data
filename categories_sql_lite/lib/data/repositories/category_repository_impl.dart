
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class CategoriesRepositoryImpl extends CategoriesRepository{

  CategoriesRepositoryImpl(){
    categoriesModel = CategoriesModel();
  }

  @override
  Future<int> deleteCategory(Category value) async {
    int? id = value.id;
    try {
      if (id != null) {
        categoriesModel.categories.remove(value);
        return await DBProvider.db.deleteCategory(id);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error deleteCategory: $e\n$t');
    }
    throw('Error deleteCategory');
  }

  @override
  Future<bool> getAllElementsGroup(Group value) async {
    int? gid = value.gid;
    try {
      if (gid != null) {
        categoriesModel.categories.addAll(
            await DBProvider.db.getAllElementsGroup(gid));
        return categoriesModel.categories.isNotEmpty;
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error getAllElementsGroup: $e\n$t');
    }
    throw('Error getAllElementsGroup');
  }

  @override
  Future<void> insertCategory(Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    try{
      categoriesModel.categories.add(await DBProvider.db.insertCategory(value, conflictAlgorithm:conflictAlgorithm));
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'log', level: 0, error: false);
      throw('Error insertCategory: $e\n$t');
    }
  }

  @override
  Future<int> updateCategory(Category oldValue, Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    categoriesModel.categories.remove(oldValue);
    categoriesModel.categories.add(value);
    return await DBProvider.db.updateCategory(value, conflictAlgorithm: conflictAlgorithm);
  }
}