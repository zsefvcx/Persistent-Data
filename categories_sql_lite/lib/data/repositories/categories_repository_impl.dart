
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:sqflite/sqflite.dart'
if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

class CategoriesRepositoryImpl extends CategoriesRepository{

  final NetworkInfo networkInfo;
//if(await networkInfo.isConnected){ <- Для работы с сетью

  CategoriesRepositoryImpl({required this.networkInfo});

  @override
  Future<int> deleteCategory(Category value) async {
    int? id = value.id;
    try {
      if (id != null) {
        return await DBProvider.db.deleteCategory(id);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error deleteCategory: $e\n$t');
    }
    throw('Error deleteCategory');
  }

  @override
  Future<List<Category>?> getCategoriesGroup(Group value, int page) async {
    int? gid = value.gid;
    try {
      if (gid != null) {
          return await DBProvider.db.getAllElementsGroup(gid, page);
      }
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error getAllElementsGroup: $e\n$t');
    }
    throw('Error getAllElementsGroup');
  }

  @override
  Future<Category?> insertCategory(Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    try{
      return await DBProvider.db.insertCategory(value, conflictAlgorithm:conflictAlgorithm);
    } catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', level: 0, error: false);
      throw('Error insertCategory: $e\n$t');
    }
  }

  @override
  Future<int> updateCategory(Category oldValue, Category value,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    return await DBProvider.db.updateCategory(value, conflictAlgorithm: conflictAlgorithm);
  }
}