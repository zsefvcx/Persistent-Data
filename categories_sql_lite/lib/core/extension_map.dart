import 'categories.dart';

/// расширение для класса Map
/// Для String ограничение в 6 символов
extension on Map {
  ///Добавляем в базу
  void add({required dynamic key, required dynamic value}){
    if(key == 'FFFFFF') throw('Key forbidden');///запрещенный ключ
    if(keys.length>100) remove(keys.first);///100 записей на одну станиуцу
    if(keys.contains(key)) throw('There is a key');///есть такой ключ
    if(key is String){
      if(key.length > 6) throw('Key no more than 6 characters');///запрещенный ключ
      putIfAbsent(key.substring(0,5), () => value);///если ключ всетаки больше то срежем его
    } else {
      putIfAbsent(key, () => value);
    }
  }

  ///Меняем в базе
  void mod({required dynamic key, required dynamic value}){
    if(key == 'FFFFFF') throw('Key forbidden');///запрещенный ключ
    if(keys.contains(key)){
      if (value is Category){
        update(key, (v) {
          if(v is Category){
            if(v==value)return v;
            return v.copyWith(
              id: v.id                   ==value.id          ?null:value.id,
              category: v.category       ==value.category    ?null:value.category,
              description: v.description ==value.description ?null:value.description,
              image: v.image             ==value.image       ?null:value.image,
              group: v.group             ==value.group       ?null:value.group,
           );
          } else {
            return value;
          }
        },);
      } else {
        update(key, (v) => value,);
      }
    } else {
      if(key is String){
        if(key.length > 6) throw('Key no more than 6 characters');///запрещенный ключ
      }
      if(keys.length>100) remove(keys.first);///100 записей на одну станиуцу
      putIfAbsent(key, () => value);
    }
  }
}