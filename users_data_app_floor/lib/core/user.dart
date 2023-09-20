import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:uuid/uuid.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable{
  @JsonKey(defaultValue: null,)
  final int?      id;
  final String    firstName;
  final String    name;
  @JsonKey(defaultValue: '')
  final String    lastName;
  @JsonKey(defaultValue: 18)
  final int       age;
  @JsonKey(defaultValue: '')
  final String    image;
  @JsonKey(defaultValue: '')
  final String    locator;
  final String    phone;
  final String    uuid;//= Uuid().v4();

  const User({
    required this.id,
    required this.firstName,
    required this.name,
    required this.lastName,
    required this.age,
    required this.image,
    required this.locator,
    required this.phone,
    required this.uuid,
  });


  User copyWith({//
    int?       id,
    String?    firstName,
    String?    name,
    String?    lastName,
    int?       age,
    String?    locator,
    String?    image,
    String?    phone,
  }) =>
      User(
        id:         id         ?? this.id,
        firstName:  firstName  ?? this.firstName,
        name:       name       ?? this.name,
        lastName:   lastName   ?? this.lastName,
        age:        age        ?? this.age,
        image:      image      ?? this.image,
        locator:    locator    ?? this.locator,
        phone:      phone      ?? this.phone,
        uuid:       uuid,//неизменно
      );

  @override
  List<Object?> get props => [
    id,
    firstName,
    name,
    lastName,
    age,
    image,
    locator,
    phone,
    uuid,
  ];

  /// Connect the generated [_$GroupFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$GroupToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "$id:$firstName:$name:$lastName:$age:$image:$locator:$phone:$uuid";
  }
}