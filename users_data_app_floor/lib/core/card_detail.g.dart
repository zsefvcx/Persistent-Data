// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetail _$CardDetailFromJson(Map<String, dynamic> json) => CardDetail(
      uuidUser: json['uuidUser'] as String,
      cardNum: json['cardNum'] as String?,
      cardYear: json['cardYear'] as int?,
      cardMonth: json['cardMonth'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CardDetailToJson(CardDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuidUser': instance.uuidUser,
      'cardNum': instance.cardNum,
      'cardYear': instance.cardYear,
      'cardMonth': instance.cardMonth,
    };
