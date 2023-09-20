
import 'package:equatable/equatable.dart';

import '../../core/core.dart';

///Группы пользователей.
abstract class AUsersEntity extends Equatable {
  final int page;//страница
  final List<User> users;//группы лучше Set. Пока так.

  const AUsersEntity(List<User> list, this.page) : users = list;

  @override
  List<Object?> get props => [
    page,
    users,
  ];

  @override
  String toString() {
    return '$page:$users';
  }
}