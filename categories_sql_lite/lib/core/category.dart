import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

///Одна категория с возможностью сравнения....
@JsonSerializable()
class Category  extends Equatable{
  @JsonKey(defaultValue: null, )
  final int?    id;
  @JsonKey(defaultValue: 0, )
  final int    gid;
  final String category;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String image;

  const Category({
    required this.id,
    required this.gid,
    required this.category,
    required this.description,
    required this.image,
  });

  Category copyWith({
    int?    id,
    int?    gid,
    String? category,
    String? description,
    String? image,
  }) =>
      Category(
        id:          id          ?? this.id,
        gid:         gid         ?? this.gid,
        category:    category    ?? this.category,
        description: description ?? this.description,
        image:       image       ?? this.image,
      );

  @override
  List<Object?> get props => [
    id,gid,
    category,
    description,
    image,
  ];

  /// Connect the generated [_$CategoryFromJson] function to the `fromJson`
  /// factory.
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Connect the generated [_$CategoryToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return "$gid:$id:$category:$description:$image:";
  }
}
