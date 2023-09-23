
import '../../core/core.dart';
import '../../domain/domain.dart';

///Модель
class UsersModel extends AUsersEntity{

  const UsersModel(Set<User> set, int page): super(set, page);
}