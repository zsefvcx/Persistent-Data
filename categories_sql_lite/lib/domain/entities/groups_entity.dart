
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Группы категорий.
abstract class AGroupsEntity extends Equatable {
  final int page;//страница
  final Set<Group> group;//группы

  AGroupsEntity(List<Group> listGroup, this.page) : group = listGroup.toSet();

  @override
  List<Object?> get props => [
    page,
    group,
  ];

  @override
  String toString() {
    return '$page:$group';
  }
}