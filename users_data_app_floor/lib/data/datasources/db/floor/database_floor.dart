import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:users_data_app_floor/core/core.dart';

part 'database_floor.g.dart'; // the generated code will be there

// @entity
// class Person {
//   @primaryKey
//   final int id;
//
//   final String name;
//
//   Person(this.id, this.name);
// }

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> get();

  @Query('SELECT name FROM User')
  Stream<List<String>> findAllUserName();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @insert
  Future<int> insertUser(User person);

  @update
  Future<int> updateUser(User person);

  @delete
  Future<int> deleteUser(User person);
}

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}

///dart run build_runner build
