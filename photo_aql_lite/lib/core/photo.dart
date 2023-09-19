

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Equatable{
  @JsonKey(defaultValue: null,)
  final int?       gid;
  @JsonKey(defaultValue: 'default')
  final String    group;
  @JsonKey(defaultValue: '')
  final String    description;
  @JsonKey(defaultValue: '')
  final String image;
  @JsonKey(defaultValue: '')
  final String locator;

  const Group({
    required this.gid,
    required this.group,
    required this.description,
    required this.image,
    required this.locator,
  });

  Group copyWith({//
    int?       gid,
    String?    group,
    String?    description,
    String?    image,
    String?    locator,
  }) =>
      Group(
        gid:         gid         ?? this.gid,
        group:       group       ?? this.group,
        description: description ?? this.description,
        image:       image       ?? this.image,
        locator:     locator     ?? this.locator,
      );

  @override
  List<Object?> get props => [
    gid,
    group,
    description,
    image,
    locator,
  ];

  /// Connect the generated [_$GroupFromJson] function to the `fromJson`
  /// factory.
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  /// Connect the generated [_$GroupToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  String toString() {
    return "$gid:$group:$description:$image";
  }
}