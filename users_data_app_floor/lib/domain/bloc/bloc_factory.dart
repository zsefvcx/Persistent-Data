
import 'package:get_it/get_it.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';


class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<UsersBloc>(
          () => UsersBloc(
            photoReadRepository: ServiceProvider.instance.get<PhotoReadRepository>(),
            usersRepository:  ServiceProvider.instance.get<UsersRepository>(),
            cardSecureRepository: ServiceProvider.instance.get<CardSecureRepository>(),
      ),
    );

  }


}