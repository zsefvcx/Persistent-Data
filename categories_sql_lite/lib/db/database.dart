import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'
       if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../core/core.dart';

class DBProvider {
  DBProvider._();
  static DBProvider? _db;
  static Database? _database;
  ///синглтон - один он в приложении...
  factory DBProvider.db() => _db ??= DBProvider._();

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}categories.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  final String _categoriesTable = 'Categories';
  final String _groupTable = 'GroupTable';
  final String _columnId = 'id';
  final String _category = 'category';
  final String _description = 'description';
  final String _image = 'image';
  final String _groupId = 'gid';
  final String _group = 'group';

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE '
            '$_groupTable('
            '$_groupId INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$_group TEXT, '
            '$_description TEXT, '
            ')'
    );
    await db.execute(
      'CREATE TABLE '
          '$_categoriesTable('
            '$_columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$_category TEXT, '
            '$_description TEXT, '
            '$_image TEXT, '
            '$_groupId INTEGER, '
            '$_group TEXT, '
          ')'
    );
  }

  ///READ GROUP



  // ///READ
  // Future<List<Category>> getCategories(int _groupId) async {
  //   Database db = await database;
  //   final List<Map<String, dynamic>> categoriesMapList =
  //       await db.query(_categoriesTable,where:);
  //
  //
  //
  //
  //
  // }

}