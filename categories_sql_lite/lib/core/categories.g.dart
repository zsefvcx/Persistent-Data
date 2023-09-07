// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int? ?? 0,
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String? ?? '',
      group: json['group'] as String? ?? 'default',
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'group': instance.group,
    };
