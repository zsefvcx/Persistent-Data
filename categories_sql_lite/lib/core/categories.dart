import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

///Категории по ИД. Ид Это уникально имя или.... Поменяем при необходимости
class Categories extends Equatable{

  final Map<String, Category> categories;

  static Categories? _instance;
  ///синглтон - один он в приложении...
  factory Categories.instance() => _instance ??= Categories._();

  Categories._() : categories = {};

  @override
  List<Object?> get props => [
    categories
  ];

  @override
  String toString() {
    return categories.toString();
  }
}

///Одна категория с возможностью сравнения....
@JsonSerializable()
class Category  extends Equatable{
  @JsonKey(defaultValue: 0, )
  final int    id;
  final String category;
  final String description;
  @JsonKey(defaultValue: '')
  final String image;
  @JsonKey(defaultValue: 0)
  final int    group;

  const Category({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.group,
  });

  Category copyWith({
    int?    id,
    String? category,
    String? description,
    String? image,
    int?    group,
  }) =>
      Category(
        id:          id          ?? this.id,
        category:    category    ?? this.category,
        description: description ?? this.description,
        image:       image       ?? this.image,
        group:       group       ?? this.group,
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
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Connect the generated [_$StudentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return "$id:$group:$category:$description:$image:";
  }
}
