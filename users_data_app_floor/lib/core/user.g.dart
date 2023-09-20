// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      firstName: json['firstName'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String? ?? '',
      image: json['image'] as String? ?? '',
      locator: json['locator'] as String? ?? '',
      phone: json['phone'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'name': instance.name,
      'lastName': instance.lastName,
      'image': instance.image,
      'locator': instance.locator,
      'phone': instance.phone,
      'uuid': instance.uuid,
    };
