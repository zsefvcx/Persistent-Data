import 'dart:io';

import 'package:users_data_app_floor/domain/domain.dart';

abstract class PhotoReadRepository {

  Future<APhotosModel> readCounter({required String locator, required String url});

  Future<(File, String)> writeCounter(String url, [String? locator]);
}