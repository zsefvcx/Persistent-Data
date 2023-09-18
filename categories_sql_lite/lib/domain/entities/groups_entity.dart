
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Группы категорий.
abstract class AGroupsEntity extends Equatable {
  final int page;//страница
  final List<Group> group;//группы

  const AGroupsEntity(List<Group> listGroup, this.page) : group = listGroup;

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