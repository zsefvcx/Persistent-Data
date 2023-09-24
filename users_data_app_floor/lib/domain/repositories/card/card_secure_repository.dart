
import 'package:users_data_app_floor/core/core.dart';

abstract class CardSecureRepository {

  Future<bool?> updateCard({required CardDetail value});

  Future<bool?> insertCard({required CardDetail value});

  Future<CardDetail?> readCard({required String uuidUser});

  Future<bool?> deleteCard({required String uuidUser});
}