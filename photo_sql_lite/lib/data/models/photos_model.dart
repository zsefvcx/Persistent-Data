
import 'package:photo_sql_lite/core/core.dart';
import 'package:photo_sql_lite/domain/domain.dart';

///Модель
class PhotosModel extends APhotosEntity{

  const PhotosModel(List<Photo> list, int page): super(list, page);
}