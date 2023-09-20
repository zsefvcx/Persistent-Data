
import 'package:equatable/equatable.dart';

class CardDetail extends Equatable{
  final int    id;
  final int    uuidUser;
  final String cardNum;
  final int    cardYear;
  final int    cardMonth;

  const CardDetail(
      this.id,
      this.uuidUser,
      this.cardNum,
      this.cardYear,
      this.cardMonth
      );

  @override
  List<Object?> get props => [
    id,
    uuidUser,
    cardNum,
    cardYear,
    cardMonth,
  ];
}
