import 'categories.dart';

/// расширение для класса Map
/// Для String ограничение в 6 символов
///
///Примечание: Если убрать имя то эта конгструкция будет действроать только в
///этом файле и импорт в другие работать не будет.
extension MyExtMap<K, V>  on Map<K, V> {
  ///Добавляем в базу
  void add({required K key, required V value}){
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
  void mod({required K key, required V value}){
    if(key == 'FFFFFF') throw('Key forbidden');///запрещенный ключ
    if(keys.contains(key)){
      if (value is Category){
        update(key, (v) {
          if(v is Category){
            Category lV = v;
            if(lV==value)return v;
            return lV.copyWith(
              id: lV.id                   ==value.id          ?null:value.id,
              category: lV.category       ==value.category    ?null:value.category,
              description: lV.description ==value.description ?null:value.description,
              image: lV.image             ==value.image       ?null:value.image,
              group: lV.group             ==value.group       ?null:value.group,
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