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
  Future<List<(int, String, String)>> getGroups() async {
    Database db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_groupTable);
     final List<(int, String, String)> groupList = [];

     for (var element in groupsMapList) {
       groupList.add(
          (
            element[_groupId],
            element[_group],
            element[_description],
          )
       );
     }
     return groupList;
  }

  ///READ ALL ELEMENT FROM GROUP
  Future<List<Category>> getAllElementsGroup(int id) async {
    Database db = await database;
    final List<Map<String, dynamic>> categoriesMapList =
    await db.query(_categoriesTable, where: '$_groupId = ?', whereArgs: [id]);
    final List<Category> categoryList = [];

    for (var element in categoriesMapList) {
      categoryList.add(
          Category.fromJson(element)
      );
    }
    return categoryList;
  }

  ///READ ALL ELEMENT
  Future<List<Category>> getAllElements() async {
    Database db = await database;
    final List<Map<String, dynamic>> categoriesMapList =
    await db.query(_categoriesTable);
    final List<Category> categoryList = [];

    for (var element in categoriesMapList) {
      categoryList.add(
          Category.fromJson(element)
      );
    }
    return categoryList;
  }

  ///INSERT
  Future<Category> insertCategory(Category data) async {
     Database db = await database;

     Category result = data.copyWith(
       gid: await db.insert(_groupTable, <String, dynamic>{
         _groupId:0,
         _group:data.group,
         _description:'...',
       })
     );

     return result.copyWith(
       id: await db.insert(_categoriesTable, result.toJson())
     );
  }

  ///UPDATE
  Future<int> updateCategory(Category data) async {
    Database db = await database;

    return await db.update(
        _categoriesTable,
        data.toJson(),
        where: '$_columnId = ?',
        whereArgs: [data.id]);

  }

  ///DELETE
  Future<int> deleteCategory(int id) async {
    Database db = await database;


    return await db.delete(
        _categoriesTable,
        where: '$_columnId = ?',
        whereArgs: [id]);
  }

  ///DELETE GID
  Future<(int, int)> deleteGroup(int gid) async {
    Database db = await database;
    return (
        await db.delete(
            _groupTable,
            where: '$_groupId = ?',
            whereArgs: [gid]),
        await db.delete(
            _categoriesTable,
            where: '$_groupId = ?',
            whereArgs: [gid]));
  }
}