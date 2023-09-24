import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../data/data.dart';
import '../data/datasources/db/database_sqflite.dart';
import 'core.dart';

enum DBType{
  sqflite,
  floor,
  drift,
}

///модель для отладки
class DebugData {
  static bool _loadingFake = false;
  static DBType dbType = DBType.sqflite;

  static Future<void> createFake() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('_loadingFake');
    if (repeat != null) _loadingFake = repeat;
    if (_loadingFake) return;
    ///Fake data in memory and db.
    Set<User> groups = {};
    String url = 'https://s00.yaplakal.com/pics/pics_original/7/4/5/18424547.jpg';
    PhotoReadFromIntFile photoReadFromIntFile = PhotoReadFromIntFileImpl();
    var (_ , uuid) = await photoReadFromIntFile.writeCounter(url: url);
    groups.add(
      User(
          id: null,
          firstName: 'Ivanov',
          name:   'Ivan',
          lastName: 'Ivanovich',
          age: 25,
          image: url,
          locator: uuid,
          phone: '+7 (123) 456-78-90',
          uuid: const Uuid().v4(),
      ),
    );

    url = 'https://artworld.ru/images/photo/ivan_shishkin_utro_v_sosnovom_lesu_30003.jpg';
    (_ , uuid) = await photoReadFromIntFile.writeCounter(url: url);
    groups.add(
      User(
        id: null,
        firstName: 'Petrov',
        name:   'Petr',
        lastName: 'Pertovich',
        age: 25,
        image: url,
        locator: uuid,
        phone: '+7 (123) 456-78-91',
        uuid: const Uuid().v4(),
      ),
    );

    url = 'https://s00.yaplakal.com/pics/pics_preview/1/3/5/18424531.jpg';
    (_ , uuid) = await photoReadFromIntFile.writeCounter(url: url);
    groups.add(
      User(
        id: null,
        firstName: 'Sidorov',
        name:   'Vasiliy',
        lastName: 'Ivanovich',
        age: 35,
        image: url,
        locator: uuid,
        phone: '+7 (123) 456-78-93',
        uuid: const Uuid().v4(),
      ),
    );

    url = 'https://s00.yaplakal.com/pics/pics_preview/2/4/2/18424242.jpg';
    (_ , uuid) = await photoReadFromIntFile.writeCounter(url: url);
    groups.add(
      User(
        id: null,
        firstName: 'Ivanov',
        name:   'Sergey',
        lastName: 'Ivanovich',
        age: 32,
        image: url,
        locator: uuid,
        phone: '+7 (123) 456-78-94',
        uuid: const Uuid().v4(),),
    );

    ///Сохраняем в db
    for(var elem in groups) {
      await DBProvider.db.insert(elem);
    }
    _loadingFake = true;
    await prefs.setBool('_loadingFake', _loadingFake);
  }
}

