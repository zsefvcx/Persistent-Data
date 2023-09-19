
import 'package:photo_aql_lite/data/data.dart';

import 'core.dart';

///модель для отладки
class FakeData {
  static bool _loadingFake = false;

  static Future<void> createFake() async {
    if (_loadingFake) return;
    ///Fake data in memory and db.
    final Set<Photo> groups = {
      //gid = null  - создается новая запись в базе данных
      //        group - сделаем уникальным
      const Photo(id: 1, name:   'Movies', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: ''),
      const Photo(id: 2, name:   'Series', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: ''),
      const Photo(id: 3, name:    'Games', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: ''),
      const Photo(id: 4, name: 'TV Shows', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: ''),
    };

    ///Сохраняем в db
    for(var elem in groups) {
      await DBProvider.db.insert(elem);
    }
    _loadingFake = true;
  }
}

