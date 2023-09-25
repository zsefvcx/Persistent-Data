
import 'dart:io';

import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';

class PhotoReadRepositoryImpl extends PhotoReadRepository{

  final PhotoReadFromIntFile photoReadFromIntFile;
  final NetworkInfo networkInfo;

  PhotoReadRepositoryImpl({
    required this.networkInfo,
    required this.photoReadFromIntFile,
  });

  @override
  Future<APhotosModel> readCounter({required String locator, required String url}) async {
    return await photoReadFromIntFile.readCounter(locator: locator, url: url);
  }

  @override
  Future<(File?, String?)> writeCounter({required String url, required String? locator}) async {
    if (await networkInfo.isConnected){
    return await photoReadFromIntFile.writeCounter(url: url, locator: locator);
    } else {
      throw ArgumentError('No internet connection!');
    }
  }

  @override
  Future<bool?> deletePhoto({required String locator}) async {
    return await photoReadFromIntFile.deletePhoto(locator: locator);
  }


}
