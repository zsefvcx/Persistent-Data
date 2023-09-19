

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable{
  @JsonKey(defaultValue: null,)
  final int?       id;
  @JsonKey(defaultValue: 'default')
  final String    name;
  @JsonKey(defaultValue: '')
  final String image;
  @JsonKey(defaultValue: '')
  final String locator;

  const Photo({
    required this.id,
    required this.name,
    required this.image,
    required this.locator,
  });

  Photo copyWith({//
    int?       gid,
    String?    name,
    String?    image,
    String?    locator,
  }) =>
      Photo(
        id:         gid         ?? this.id,
        name:       name       ?? this.name,
        image:       image       ?? this.image,
        locator:     locator     ?? this.locator,
      );

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    locator,
  ];

  /// Connect the generated [_$GroupFromJson] function to the `fromJson`
  /// factory.
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  /// Connect the generated [_$GroupToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  String toString() {
    return "$id:$name:$image";
  }
}