import 'package:flutter/material.dart';

import 'dialog_fields.dart';

class TextFFC extends StatelessWidget {
  const TextFFC({
    super.key,
    required DialogField dialogFields,
    String? Function(String? value)? validator,
  }) : _dialogFields = dialogFields;

  final DialogField _dialogFields;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: _dialogFields.width,
          height: _dialogFields.height,
          child: TextFormField(
            controller: _dialogFields.controller,
            maxLines: 1,
            maxLength: 255,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: _dialogFields.label,
            ),
            validator: (value) {
              String? Function(String? value)? fun = _dialogFields.validator;
              if(fun != null){
                return fun(value);
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}