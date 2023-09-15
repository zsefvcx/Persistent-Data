
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Категории.
class CategoriesEntity extends Equatable{

  final Set<Category> categories;//категории

  static CategoriesEntity? _instance;
  ///синглтон - один он в приложении...
  factory CategoriesEntity.instance() => _instance ??= CategoriesEntity._();

  CategoriesEntity._() : categories = {};

  @override
  List<Object?> get props => [
    categories,
  ];

  @override
  String toString() {
    return '$categories';
  }
}

