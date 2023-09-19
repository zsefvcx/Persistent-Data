
import 'package:equatable/equatable.dart';
import 'package:photo_aql_lite/core/core.dart';

///Группы категорий.
abstract class AGroupsEntity extends Equatable {
  final int page;//страница
  final List<Group> groups;//группы

  const AGroupsEntity(List<Group> listGroup, this.page) : groups = listGroup;

  @override
  List<Object?> get props => [
    page,
    groups,
  ];

  @override
  String toString() {
    return '$page:$groups';
  }
}