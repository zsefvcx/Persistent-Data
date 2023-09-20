import 'package:shared_preferences/shared_preferences.dart';

import '../data/data.dart';
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
    Set<User> groups = {};
    String url = 'https://s00.yaplakal.com/pics/pics_original/7/4/5/18424547.jpg';
    var (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      User(id: null, name:   'Movies', image: url, locator: uuid),
    );

    url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      User(id: null, name:   'Series', image: url, locator: uuid),
    );

    url = 'https://s00.yaplakal.com/pics/pics_preview/1/3/5/18424531.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      User(id: null, name:   'Games', image: url, locator: uuid),
    );

    url = 'https://s00.yaplakal.com/pics/pics_preview/2/4/2/18424242.jpg';
    (_ , uuid) = await PhotoReadFromIntFile().writeCounter(url);
    groups.add(
      User(id: null, name:   'TV Shows', image: url, locator: uuid),
    );

    ///Сохраняем в db
    for(var elem in groups) {
      await DBProvider.db.insert(elem);
    }
    _loadingFake = true;
    await prefs.setBool('_loadingFake', _loadingFake);
  }
}

