
import 'package:photo_aql_lite/core/core.dart';
import 'package:photo_aql_lite/domain/domain.dart';

///Модель
class GroupsModel extends AGroupsEntity{

  const GroupsModel(List<Group> listGroup, int page): super(listGroup, page);
}