import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';

///Модель
class CategoriesModel extends ACategoriesEntity{

  const CategoriesModel(List<Category> listCategory, int page): super(listCategory, page);
}