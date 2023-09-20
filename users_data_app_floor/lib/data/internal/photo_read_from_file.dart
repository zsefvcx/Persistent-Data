
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../core/core.dart';

class PhotoReadFromIntFile {


  Future<String> get _localPath async {
    final directory = await getApplicationCacheDirectory();

    return directory.path;
  }

  Future<(File, String)> _localFile({String? uuid}) async {
    String uuidLoc = uuid ??= (const Uuid()).v4();
    final path = '${await _localPath}/photo_$uuidLoc';
    Logger.print("PathToPhoto:$path", name: 'log', level: 0, error: false);
    return (File(path), uuidLoc);
  }

  Future<(Uint8List, String)> readCounter({String? uuid}) async {
    try {
      final (file, uuidLoc) = await _localFile(uuid: uuid);
      final contents = await file.readAsBytes();
      return (contents, uuidLoc);
    } catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error readCounter!');
    }
  }

  Future<(File, String)> writeCounter(String url, [String? uuid]) async {
    try {
      final (file, uuidLoc) = await _localFile(uuid: uuid);

      final dio = Dio();
      final response = await dio.get<List<int>>(
          url,
          options: Options(responseType: ResponseType.bytes), // Set the response type to `bytes`.
      );

      if (response.statusCode == 200){
        var elements = response.data;
        if (elements != null) {
          Uint8List? bytes = Uint8List.fromList(elements);
          return (await file.writeAsBytes(bytes, mode: FileMode.write), uuidLoc);
        }
      }
      Logger.print('${response.statusCode}', name: 'err', level: 1, error: true);
      throw('Error response HTTP/S writeCounter()!');
    } catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw('Error writeCounter!');
    }
  }
}