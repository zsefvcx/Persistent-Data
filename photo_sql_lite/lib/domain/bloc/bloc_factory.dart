
import 'package:get_it/get_it.dart';
import 'package:photo_sql_lite/data/data.dart';
import 'package:photo_sql_lite/domain/domain.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<PhotosBloc>(
          () => PhotosBloc(
            photosRepository:  ServiceProvider.instance.get<PhotosRepository>(),
      ),
    );

  }


}