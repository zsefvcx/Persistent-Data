import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt.registerLazySingleton<GroupsRepository>(
          () => GroupsRepositoryImpl(networkInfo: networkInfo
      ),
    );
    _getIt.registerLazySingleton<CategoriesRepository>(
          () => CategoriesRepositoryImpl(networkInfo: networkInfo
      ),
    );
  }
}