

import '../../core/core.dart';
import '../../domain/domain.dart';

///Модель
class PhotosModel extends APhotosEntity{

  const PhotosModel(List<Photo> list, int page): super(list, page);
}