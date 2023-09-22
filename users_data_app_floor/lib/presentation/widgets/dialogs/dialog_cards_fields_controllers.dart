import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'dialog_field.dart';

class DialogCardsFieldsAndControllers{
  static final formKey = GlobalKey<FormState>();

  static late TextEditingController _cardNumber;
  static late TextEditingController _cardYear;
  static late TextEditingController _cardMonth;


  static late TextEditingController _image;
  static late TextEditingController _phone;
  static late TextEditingController _age;

  static initControllers({required CardDetail data}){
    _cardNumber = TextEditingController();
    _cardNumber.text = data.cardNum??'';
    _cardYear = TextEditingController();
    _cardYear.text   =(data.cardYear??2023).toString();
    _cardMonth = TextEditingController();
    _cardMonth.text  =(data.cardMonth??2023).toString();

  }

  static disposeControllers(){
    _cardNumber.dispose();
    _cardYear.dispose();
    _cardMonth.dispose();
  }

  static User userData({required User oldData}) {
    final int age = int.parse(_age.text);
    return User(
      id: oldData.id,
      uuid: oldData.uuid,
      firstName: _cardNumber.text,
      name:  _cardMonth.text,
      lastName: _cardYear.text,
      phone: _phone.text,
      age: age,
      image: _image.text,
      locator: oldData.locator,
    );
  }

  static List<DialogField> get allFields => <DialogField>[
    DialogField(controller: _cardNumber,
      label: 'Card Number',
      validator: ValidatorFields.checkName,
    ),
    DialogField(controller: _cardMonth,
      label: 'Month',
      validator: ValidatorFields.checkName,
    ),
    DialogField(controller: _cardYear,
      label: 'Year',
      validator: ValidatorFields.checkLastName,
    ),
  ];

}