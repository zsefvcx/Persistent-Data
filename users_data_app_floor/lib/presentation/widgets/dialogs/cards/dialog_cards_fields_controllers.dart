import 'package:flutter/material.dart';

import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/dialog_field.dart';

class DialogCardsFieldsAndControllers{
  static final formKey = GlobalKey<FormState>();

  static late TextEditingController _cardNumber;
  static late TextEditingController _cardYear;
  static late TextEditingController _cardMonth;

  static void initControllers({required CardDetail data}){
    _cardNumber = TextEditingController();
    _cardNumber.text = data.cardNum??'';
    _cardYear = TextEditingController();
    _cardYear.text   =(data.cardYear??23).toString();
    _cardMonth = TextEditingController();
    _cardMonth.text  =(data.cardMonth??09).toString();

  }

  static void disposeControllers(){
    _cardNumber.dispose();
    _cardYear.dispose();
    _cardMonth.dispose();
  }

  static CardDetail userData({required CardDetail oldData}) {
    final cardMonth = int.parse(_cardMonth.text);
    final cardYear = int.parse(_cardYear.text);
    return CardDetail(
      id: oldData.id,
      uuidUser: oldData.uuidUser,
      cardNum: _cardNumber.text,
      cardMonth:  cardMonth,
      cardYear: cardYear,
    );
  }

  static List<DialogField> get allFields => <DialogField>[
    ///https://pub.dev/packages/credit_card_validator
    DialogField(controller: _cardNumber,
      label: 'Card Number (1234 5678 9012 3456)',
      validator: ValidatorFields.checkCreditCard,
      maxLength: 19,
    ),
    DialogField(controller: _cardMonth,
      label: 'Month (12)',
      validator: ValidatorFields.checkMonth,
      maxLength: 2,
    ),
    DialogField(controller: _cardYear,
      label: 'Year (34)',
      validator: ValidatorFields.checkYear,
      maxLength: 2
    ),
  ];

}
