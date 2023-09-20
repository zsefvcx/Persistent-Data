

import '../../core/core.dart';
import '../../domain/domain.dart';

///Модель
class UsersModel extends AUsersEntity{

  const UsersModel(List<User> list, int page): super(list, page);
}