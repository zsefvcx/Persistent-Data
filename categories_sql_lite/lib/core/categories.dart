import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

///Категории по ИД.
class Categories extends Equatable{

  final Map<String, Category> categories;//категории
  final Map<String, Group> group;//группы

  static Categories? _instance;
  ///синглтон - один он в приложении...
  factory Categories.instance() => _instance ??= Categories._();

  Categories._() : categories = {}, group = {};

  @override
  List<Object?> get props => [
    categories,
    group,
  ];

  @override
  String toString() {
    return '$categories\n$group';
  }
}

@JsonSerializable()
class Group extends Equatable{
  @JsonKey(defaultValue: 0,)
  final int       gid;
  @JsonKey(defaultValue: 'default')
  final String    group;
  @JsonKey(defaultValue: '')
  final String    description;

  const Group({
    required this.gid,
    required this.group,
    required this.description,
  });

  Group copyWith({
    int?       gid,
    String?    group,
    String?    description,

  }) =>
      Group(
        gid:         gid         ?? this.gid,
        group:       group       ?? this.group,
        description: description ?? this.description,
      );

  @override
  List<Object?> get props => [
    gid,
    group,
    description,
  ];

  /// Connect the generated [_$GroupFromJson] function to the `fromJson`
  /// factory.
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  /// Connect the generated [_$GroupToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  String toString() {
    return "$gid:$group:$description";
  }
}

///Одна категория с возможностью сравнения....
@JsonSerializable()
class Category  extends Equatable{
  @JsonKey(defaultValue: 0, )
  final int    id;
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
