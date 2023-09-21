
import 'package:equatable/equatable.dart';

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
}
