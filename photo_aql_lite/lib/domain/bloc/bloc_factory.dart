
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<GroupsBloc>(
          () => GroupsBloc(
            groupsRepository:  ServiceProvider.instance.get<GroupsRepository>(),
      ),
    );

  }


}