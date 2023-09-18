
import 'package:categories_sql_lite/core/core.dart';
import 'package:equatable/equatable.dart';

///Модель
class CategoriesEntity extends ACategoriesEntity{
  static CategoriesEntity? _instance;
  ///синглтон - один он в приложении...
  factory CategoriesEntity.instance() => _instance ??= const CategoriesEntity._();

  const CategoriesEntity._() : super(const <Category>[], 0);
}

///Категории.
abstract class ACategoriesEntity extends Equatable{
  final int page;//страница
  final List<Category> categories;//категории

  const ACategoriesEntity(List<Category> listCategory, this.page) : categories = listCategory;

  @override
  List<Object?> get props => [
    page,
    categories,
  ];

  @override
  String toString() {
    return '$page:$categories';
  }
}

