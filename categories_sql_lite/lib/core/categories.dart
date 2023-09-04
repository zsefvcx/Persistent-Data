import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

///Одна категория с возможностью сравнения....
@JsonSerializable()
class Categories  extends Equatable{
  @JsonKey(defaultValue: 0, )
  final int id;
  final String category;
  final String description;
  @JsonKey(defaultValue: '')
  final String image;
  @JsonKey(defaultValue: 0)
  final int group;

  const Categories({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.group,
  });

  Categories copyWith({
    int? id,
    String? category,
    String? description,
    String? image,
    int? group,
  }) =>
      Categories(
        id: id ?? this.id,
        category: category ?? this.category,
        description: description ?? this.description,
        image: image ?? this.image,
        group: group ?? this.group,
      );

  @override
  List<Object?> get props => [
    id,
    category,
    description,
    image,
    group,
  ];

  /// Connect the generated [_$StudentFromJson] function to the `fromJson`
  /// factory.
  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  /// Connect the generated [_$StudentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  @override
  String toString() {
    return "$id:$group:$category:$description:$image:";
  }
}
