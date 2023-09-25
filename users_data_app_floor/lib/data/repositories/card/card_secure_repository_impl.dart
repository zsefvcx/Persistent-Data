
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';

class CardSecureRepositoryImpl extends CardSecureRepository{

  final AddModSecureStorage addModSecureStorage;

  CardSecureRepositoryImpl({
    required this.addModSecureStorage,
  });

  @override
  Future<bool?> insertCard({required CardDetail value}) async {
    return await addModSecureStorage.insertCard(value: value);
  }

  @override
  Future<CardDetail?> readCard({required String uuidUser}) async {
    return await addModSecureStorage.readCard(uuidUser: uuidUser);
  }

  @override
  Future<bool?> updateCard({required CardDetail value}) async {
    return await addModSecureStorage.updateCard(value: value);
  }

  @override
  Future<bool?> deleteCard({required String uuidUser}) async {
    return await addModSecureStorage.deleteCard(uuidUser: uuidUser);
  }

}
