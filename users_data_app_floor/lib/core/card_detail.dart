
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_detail.g.dart';

@JsonSerializable()
class CardDetail extends Equatable{
  final int?    id;
  final String    uuidUser;
  final String? cardNum;
  final int?    cardYear;
  final int?    cardMonth;

  const CardDetail({
    this.id,
    required this.uuidUser,
    required this.cardNum,
    required this.cardYear,
    required this.cardMonth
  });

  @override
  List<Object?> get props => [
    id,
    uuidUser,
    cardNum,
    cardYear,
    cardMonth,
  ];

  /// Connect the generated [_$CardDetailFromJson] function to the `fromJson`
  /// factory.
  factory CardDetail.fromJson(Map<String, dynamic> json) => _$CardDetailFromJson(json);

  /// Connect the generated [_$CardDetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CardDetailToJson(this);

  @override
  String toString() {
    return "$id:$uuidUser:$cardNum:$cardYear:$cardMonth";
  }
}
