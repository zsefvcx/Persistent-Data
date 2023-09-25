import 'dart:typed_data';

abstract class APhotosModel{
  final String locator;
  final String url;
  final Uint8List contents;

  APhotosModel({required this.locator, required this.url, required this.contents});
}
