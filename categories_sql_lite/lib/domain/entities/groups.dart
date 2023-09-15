
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Группы категорий.
class GroupsEntity extends Equatable {

  final Set<Group> group;//группы

  static GroupsEntity? _instance;
  ///синглтон - один он в приложении...
  factory GroupsEntity.instance() => _instance ??= GroupsEntity._();

  GroupsEntity._() : group = {};

  @override
  List<Object?> get props => [
    group,
  ];

  @override
  String toString() {
    return '$group';
  }

}