import '../data/db/database.dart';
import '../core/category.dart';

/// расширение для класса Map
/// Для String ограничение в 6 символов
///
///Примечание: Если убрать имя то эта конгструкция будет действроать только в
///этом файле и импорт в другие работать не будет.
enum TypeT{
  isGroup,
  isCategory,
}

extension MyExtSet<V>  on Set<V> {
  ///не более [ $countValue ] записей
  static int countValue = 100;

  ///Читаем из базы. Потом переделать.
  Future<void> addAllEx(TypeT type, {int id = -1}) async {
    if (type == TypeT.isCategory) {
      addAll(await DBProvider.db.getAllElementsGroup(id) as List<V>);
    } else if (type == TypeT.isGroup) {
      addAll(await DBProvider.db.getGroups() as List<V>);
    }
  }

  ///Меняем в базе. менять не целесообразно в сете. Потом если использовать Bloc
  ///пересмотрть на уровне данных.
  Future<void> modEx({required V value}) async {
    if (value is Group) {
      int? gid = value.gid;
      if(gid != null) {
        await DBProvider.db.updateGroup(value);
      }
    } else if(value is Category) {
      int? id = value.id;
      if ( id != null) {
        await DBProvider.db.updateCategory(value);
      }
    }
  }

  ///Добавляем в базу
  Future<void> addEx({required V value}) async {
    if (value is Group) {
      int? gid = value.gid;
      if(length>countValue && gid != null) {
        await DBProvider.db.deleteGroup(gid);
        remove(first);
      }
      add(await DBProvider.db.insertGroup(value) as V);
    } else if(value is Category) {
      int? id = value.id;
      if(length>countValue && id != null) {
        await DBProvider.db.deleteCategory(id);
        remove(first);
      }
      add(await DBProvider.db.insertCategory(value) as V);
    } else {
      if(length>100) {///100 записей на одну категрию
        remove(first);
      }
      add(value);
    }

  }

  Future<void> removeEx({required V value}) async {
    if (value is Group) {
      int? gid = value.gid;
      if (gid != null){
        await DBProvider.db.deleteGroup(gid);
      }
    }
    if (value is Category) {
      int? id = value.id;
      if (id != null){
        await DBProvider.db.deleteCategory(id);
      }
    }
    remove(value);
  }


  // ///Меняем в базе
  // void modEx({ required V value}){
  //   if(key == 'FFFFFF') throw('Key forbidden');///запрещенный ключ
  //   if(keys.contains(key)){
  //     if (value is Category){
  //       update(key, (v) {
  //         if(v is Category){
  //           Category lV = v;
  //           if(lV==value)return v;
  //           return lV.copyWith(
  //             id: lV.id                   ==value.id          ?null:value.id,
  //             category: lV.category       ==value.category    ?null:value.category,
  //             description: lV.description ==value.description ?null:value.description,
  //             image: lV.image             ==value.image       ?null:value.image,
  //             gid: lV.gid             ==value.gid       ?null:value.gid,
  //          ) as V;
  //         } else {
  //           return value;
  //         }
  //       },);
  //     } else {
  //       update(key, (v) => value,);
  //     }
  //   } else {
  //     if(keys.length>100) remove(keys.first);///100 записей на одну станиуцу
  //     if(key is String){
  //       if(key.length > 6) throw('Key no more than 6 characters');///запрещенный ключ
  //       putIfAbsent(key.substring(0,6) as K, () => value);///если ключ всетаки больше то срежем его
  //     } else {
  //       putIfAbsent(key, () => value);
  //     }
  //   }
  // }
}