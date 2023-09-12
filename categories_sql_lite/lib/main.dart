import 'package:flutter/material.dart';

import 'categories_app.dart';
import 'core/core.dart';



void main() {
  ///Fake data in memory
  Categories.instance().group.addAll(<Group>{
    const Group(gid: 0, group:   'Movies', description: 'Фильмы'),
    const Group(gid: 0, group:   'Series', description:  'Серии'),
    const Group(gid: 0, group:    'Games', description:   'Игры'),
    const Group(gid: 0, group: 'TV Shows', description: 'ТВ Шоу'),
  }
  );
  Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);


  runApp(const CategoriesApp());
}

