

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:users_data_app_floor/core/card_detail.dart';
import 'package:users_data_app_floor/data/data.dart';

///https://pub.dev/packages/flutter_secure_storage

class AddModSecureStorageImpl extends AddModSecureStorage{

  // Create storage
  final FlutterSecureStorage storage = const FlutterSecureStorage(aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  AddModSecureStorageImpl();

  @override
  Future<bool> insertCard({required CardDetail value}) async{
    try{
      Map<String, dynamic> json = value.toJson();
      String res = jsonEncode(json);
      // Write value
      await storage.write(key: value.uuidUser, value: res);
      return true;
    } catch(e){
      throw('Error writeCard: $e');
    }
  }

  @override
  Future<CardDetail?> readCard({required String uuidUser}) async {
    try {
      final res = await storage.read(key: uuidUser);
      Map<String, dynamic> json = {};
      if (res != null) {
        json = jsonDecode(res);
        return CardDetail.fromJson(json);
      } else {
        return null;
      }
    } catch(e){
      throw('Error readCard: $e');
    }
  }

  @override
  Future<bool> updateCard({required CardDetail value}) async {
    return await insertCard(value: value);
  }

  @override
  Future<bool> deleteCard({required String uuidUser}) async{
    try{
      await storage.delete(key: uuidUser,);
      return true;
    } catch(e){
      throw('Error writeCard: $e');
    }
  }

}