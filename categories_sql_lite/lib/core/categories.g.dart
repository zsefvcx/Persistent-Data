// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as int? ?? 0,
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String? ?? '',
      group: json['group'] as int? ?? 0,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'group': instance.group,
    };
