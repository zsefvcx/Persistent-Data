
import 'dart:io';

import 'package:users_data_app_floor/data/data.dart';

abstract class PhotoReadFromIntFile {

  Future<String> get localPath;

  Future<(File, String)> localFile({String? locator});

  Future<PhotosModel> readCounter({required String locator, required String url});

  Future<(File, String)> writeCounter({required String url, String? locator});

  Future<bool> deletePhoto({required String locator});
}
