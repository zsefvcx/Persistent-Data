
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///модель
class GroupsEntity extends AGroupsEntity {
  static GroupsEntity? _instance;
  ///синглтон - один он в приложении...
  factory GroupsEntity.instance() => _instance ??= GroupsEntity._();

  GroupsEntity._() : super();
}

///Группы категорий.
abstract class AGroupsEntity extends Equatable {
  final Set<Group> group;//группы

  AGroupsEntity() : group = {};

  @override
  List<Object?> get props => [
    group,
  ];

  @override
  String toString() {
    return '$group';
  }
}