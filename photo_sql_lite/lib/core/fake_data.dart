
import 'package:photo_sql_lite/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core.dart';

///модель для отладки
class FakeData {
  static bool _loadingFake = false;

  static Future<void> createFake() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('_loadingFake');
    if (repeat != null) _loadingFake = repeat;
    if (_loadingFake) return;
    ///Fake data in memory and db.
    Set<Photo> groups = {};
    String url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    var (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      Photo(id: null, name:   'Movies', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: uuid),
    );

    url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      Photo(id: null, name:   'Series', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: uuid),
    );

    url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      Photo(id: null, name:   'Games', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: uuid),
    );

    url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      Photo(id: null, name:   'TV Shows', image: 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg', locator: uuid),
    );

    ///Сохраняем в db
    for(var elem in groups) {
      await DBProvider.db.insert(elem);
    }
    _loadingFake = true;
    await prefs.setBool('_loadingFake', _loadingFake);
  }
}

