import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());
  final PhotoReadFromIntFile photoReadFromIntFile = PhotoReadFromIntFileImpl();
  final GetDataUsers getDataUsers = GetDataUsersImpl();
  final AddModSecureStorage addModSecureStorage = AddModSecureStorageImpl();

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt..registerLazySingleton<PhotoReadRepository>(
          () => PhotoReadRepositoryImpl(
            networkInfo: networkInfo,
            photoReadFromIntFile: photoReadFromIntFile,
      ),
    )
    ..registerLazySingleton<UsersRepository>(
          () => UsersRepositoryImpl(getDataUsers: getDataUsers
      ),
    )
    ..registerLazySingleton<CardSecureRepository>(
          () => CardSecureRepositoryImpl(addModSecureStorage: addModSecureStorage
      ),
    );
  }
}
