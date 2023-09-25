
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:uuid/uuid.dart';


class PhotoReadFromIntFileImpl extends PhotoReadFromIntFile {

  final Map<String, PhotosModel>  mapPhotosModel =  {};

  PhotosModel mapPhotosModelAdd(String locator, String url, Uint8List contents){
    //Добавляем в оперативку >30 файлов, чтобы база не грузила операивку
    final val = mapPhotosModel[locator];
    if  ((val != null && val.url != url) || val == null){
      final PhotosModel photosModel = PhotosModel(
          contents: contents,
          url: url,
          locator: locator,
      );
      mapPhotosModel[locator] = photosModel;
      if(mapPhotosModel.length > 30){
        String uuidFirst = mapPhotosModel.keys.first;
        mapPhotosModel.remove(uuidFirst);
      }
      return photosModel;
    } else {
      return val;
    }
  }


  @override
  Future<String> get localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  @override
  Future<(File, String)> localFile({String? locator}) async {
    String locatorLoc = locator ??= (const Uuid()).v4();
    final path = '${await localPath}/photo_$locatorLoc';
    Logger.print("PathToPhoto:$path", name: 'log', level: 0, error: false);
    return (File(path), locatorLoc);
  }

  @override
  Future<PhotosModel> readCounter({required String locator, required String url}) async {
    try {
      final res = mapPhotosModel[locator];
      if(res == null) { //еще не разу не грузили за сессию
        final (file, locatorLoc) = await localFile(locator: locator);
        final contents = await file.readAsBytes();
        return mapPhotosModelAdd( locatorLoc, url, contents);
      } else {
        return res;
      }
    } catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error readCounter!');
    }
  }

  @override
  Future<(File, String)> writeCounter({required String url, String? locator}) async {
    try {
      final (file, locatorLoc) = await localFile(locator: locator);
      final dio = Dio();
      final response = await dio.get<List<int>>(
          url,
          options: Options(responseType: ResponseType.bytes), // Set the response type to `bytes`.
      );

      if (response.statusCode == 200){
        var elements = response.data;
        if (elements != null) {
          Uint8List? contents = Uint8List.fromList(elements);
          final File fileLocal = await file.writeAsBytes(contents, mode: FileMode.write);
          mapPhotosModelAdd( locatorLoc, url, contents);
          return (fileLocal, locatorLoc);
        }
      }
      Logger.print('${response.statusCode}', name: 'err', level: 1, error: true);
      throw('Error response HTTP/S writeCounter()!');
    } catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error writeCounter!');
    }
  }

  @override
  Future<bool> deletePhoto({required String locator}) async {
    try {
      final (file, _) = await localFile(locator: locator);
      await file.delete();
      final res = mapPhotosModel[locator];
      if(res != null) {
        mapPhotosModel.remove(locator);
      }
      return true;
    } catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error readCounter!');
    }
  }

}