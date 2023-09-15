
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Модель
class CategoriesEntity extends ACategoriesEntity{
  static CategoriesEntity? _instance;
  ///синглтон - один он в приложении...
  factory CategoriesEntity.instance() => _instance ??= CategoriesEntity._();

  CategoriesEntity._() : super();
}

///Категории.
abstract class ACategoriesEntity extends Equatable{
  final Set<Category> categories;//категории

  ACategoriesEntity() : categories = {};

  @override
  List<Object?> get props => [
    categories,
  ];

  @override
  String toString() {
    return '$categories';
  }
}

