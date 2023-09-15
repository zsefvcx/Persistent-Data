import 'dart:io';

import 'package:categories_sql_lite/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';

///https://pub.dev/packages/hive

class DBProvider {
  DBProvider._();
  static DBProvider? _db;
  static Database? _database;
  ///синглтон - один он в приложении...
  ///Его повсемесное использование в приложении плохой тон, но когда надо быстро то можно))
  ///Без использовния Factory
  static DBProvider get db => _db ??= DBProvider._();

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}categories.db';
    Logger.print("PathToDB:$path", name: 'log', level: 0, error: false);
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
    try {
      await db.execute(
          'CREATE TABLE "$_groupTable" ("$_groupId" INTEGER PRIMARY KEY AUTOINCREMENT, "$_group" TEXT, "$_description" TEXT, "$_image" TEXT)'
      );
      await db.execute(
        'CREATE TABLE "$_categoriesTable" ("$_columnId" INTEGER PRIMARY KEY AUTOINCREMENT, "$_category" TEXT, "$_description" TEXT, "$_image" TEXT, "$_groupId" INTEGER, "$_group" TEXT)'
      );
    } catch (e,t){
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error create db!');
    }
  }

  ///READ GROUP
  Future<List<Group>> getGroups() async {
    Database db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_groupTable);
    final List<Group> groupList = [];

    for (var element in groupsMapList) {
      groupList.add(
          Group.fromJson(element)
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

  ///INSERT Group
  Future<Group> insertGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    Database db = await database;

    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_group" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_description" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_image" TEXT');

    ///Имя должно быть уникальное
    List<Map<String, dynamic>> query = await db.query(_groupTable, where: '"$_group" = ?', whereArgs: [data.group]);
    if (query.isNotEmpty){
      if (query[0].isNotEmpty){///только первое вхождение
        var gid = query[0][_groupId];
        if (gid != null && gid is int){
          return data.copyWith(
            gid: gid,
          );
        }
      }
    }

    int gid = await db.insert(
      _groupTable,
      data.toJson(),
      conflictAlgorithm: conflictAlgorithm,
    );
    return data.copyWith(
      gid: gid,
    );
  }

  ///INSERT Category
  Future<Category> insertCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
     Database db = await database;

     ///gid должен быть
     List<Map<String, dynamic>> query = await db.query(_groupTable, where: '"$_groupId" = ?', whereArgs: [data.gid]);
     if (query.isEmpty){
       throw('Error insert category in db! Group is not in db');
     }

     int id = await db.insert(
         _categoriesTable,
         data.toJson(),
         conflictAlgorithm: conflictAlgorithm,
     );

     return data.copyWith(
       id: id
     );
  }

  ///UPDATE Group
  Future<int> updateGroup(Group data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    Database db = await database;

    return await db.update(
        _groupTable,
        data.toJson(),
        where: '"$_groupId" = ?',
        whereArgs: [data.gid],
        conflictAlgorithm: conflictAlgorithm,
    );

  }

  ///UPDATE Category
  Future<int> updateCategory(Category data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    Database db = await database;

    return await db.update(
        _categoriesTable,
        data.toJson(),
        where: '"$_columnId" = ?',
        whereArgs: [data.id],
        conflictAlgorithm: conflictAlgorithm,
    );

  }

  ///DELETE ID
  Future<int> deleteCategory(int id) async {
    Database db = await database;

    return await db.delete(
        _categoriesTable,
        where: '"$_columnId" = ?',
        whereArgs: [id]);
  }

  ///DELETE GID
  Future<(int, int)> deleteGroup(int gid) async {
    Database db = await database;

    return (
        await db.delete(
            _groupTable,
            where: '"$_groupId" = ?',
            whereArgs: [gid]),
        await db.delete(
            _categoriesTable,
            where: '"$_groupId" = ?',
            whereArgs: [gid]));
  }
}