// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      gid: json['gid'] as int?,
      group: json['group'] as String? ?? 'default',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      locator: json['locator'] as String? ?? '',
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'gid': instance.gid,
      'group': instance.group,
      'description': instance.description,
      'image': instance.image,
      'locator': instance.locator,
    };
