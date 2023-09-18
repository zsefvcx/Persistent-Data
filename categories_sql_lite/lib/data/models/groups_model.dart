import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';

///Модель
class GroupsModel extends AGroupsEntity{

  GroupsModel(List<Group> listGroup, int page): super(listGroup, page);
}