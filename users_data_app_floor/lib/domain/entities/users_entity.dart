
import 'package:equatable/equatable.dart';

import '../../core/core.dart';

///Группы пользователей.
abstract class AUsersEntity extends Equatable {
  final int page;//страница
  final Set<User> users;//группы лучше Set. Пока так.

  const AUsersEntity(Set<User> set, this.page) : users = set;

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