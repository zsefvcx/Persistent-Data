import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:photo_aql_lite/core/core.dart';
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
    String path = '${dir.path}_photo_base.db';
    Logger.print("PathToDB:$path", name: 'log', level: 0, error: false);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  final String _table = 'PhotosTable';
  final String _image = 'image';
  final String _locator = 'locator';
  final String _id = 'id';
  final String _name = 'name';

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE "$_table" ("$_id" INTEGER PRIMARY KEY AUTOINCREMENT, "$_name" TEXT, "$_image" TEXT, "$_locator" TEXT)'
      );
    } catch (e,t){
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error create db!');
    }
  }

  ///READ GROUP
  ///Пока получаем все элементы из списка
  Future<List<Photo>> get(int page) async {
    Database db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_table,
          // where: '$_columnId = ?',
          //whereArgs: [page*10]
        );
    final List<Photo> groupList = [];

    for (var element in groupsMapList) {
      groupList.add(
          Photo.fromJson(element)
      );
    }
    return groupList;
  }

  ///INSERT Group
  Future<Photo> insert(Photo data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    Database db = await database;

    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_group" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_description" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_image" TEXT');

    ///Имя должно быть уникальное
    List<Map<String, dynamic>> query = await db.query(_table, where: '"$_name" = ?', whereArgs: [data.name]);
    if (query.isNotEmpty){
      if (query[0].isNotEmpty){///только первое вхождение
        var gid = query[0][_id];
        if (gid != null && gid is int){
          return data.copyWith(
            gid: gid,
          );
        }
      }
    }

    int gid = await db.insert(
      _table,
      data.toJson(),
      conflictAlgorithm: conflictAlgorithm,
    );
    return data.copyWith(
      gid: gid,
    );
  }

  ///UPDATE Group
  Future<int> update(Photo data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    Database db = await database;

    return await db.update(
        _table,
        data.toJson(),
        where: '"$_id" = ?',
        whereArgs: [data.id],
        conflictAlgorithm: conflictAlgorithm,
    );

  }

  ///DELETE GID
  Future<int> delete(int gid) async {
    Database db = await database;
    return await db.delete(
            _table,
            where: '"$_id" = ?',
            whereArgs: [gid]);
  }
}