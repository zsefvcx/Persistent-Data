


import 'package:users_data_app_floor/core/card_detail.dart';
import 'package:users_data_app_floor/data/data.dart';

///https://pub.dev/packages/flutter_secure_storage

class AddModSecureStorageImpl extends AddModSecureStorage{
  @override
  Future<bool> insertCard({required CardDetail value}) async{
    return true;
  }

  @override
  Future<CardDetail> readCard({required String uuidUser}) async {
    return CardDetail(
        id: 1,
        uuidUser: uuidUser,
        cardNum: '1234 5678 9012 3456',
        cardYear: 23,
        cardMonth: 9);
  }

  @override
  Future<bool> updateCard({required CardDetail value}) async {
    return true;
  }

  @override
  Future<bool> deleteCard({required String uuidUser}) async{
    return true;
  }

}