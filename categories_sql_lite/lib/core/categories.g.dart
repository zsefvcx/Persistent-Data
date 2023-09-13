// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      gid: json['gid'] as int?,
      group: json['group'] as String? ?? 'default',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'gid': instance.gid,
      'group': instance.group,
      'description': instance.description,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      gid: json['gid'] as int? ?? 0,
      category: json['category'] as String,
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'gid': instance.gid,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
    };
