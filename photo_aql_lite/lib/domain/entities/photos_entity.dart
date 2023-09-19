
import 'package:equatable/equatable.dart';
import 'package:photo_aql_lite/core/core.dart';

///Группы категорий.
abstract class APhotosEntity extends Equatable {
  final int page;//страница
  final List<Photo> photos;//группы

  const APhotosEntity(List<Photo> list, this.page) : photos = list;

  @override
  List<Object?> get props => [
    page,
    photos,
  ];

  @override
  String toString() {
    return '$page:$photos';
  }
}