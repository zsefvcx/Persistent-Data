import 'package:flutter/material.dart';

import 'package:users_data_app_floor/presentation/widgets/dialogs/dialog_field.dart';

class TextFFC extends StatelessWidget {
  const TextFFC({
    required DialogField dialogFields, super.key,
  }) : _dialogFields = dialogFields;

  final DialogField _dialogFields;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        SizedBox(
          width: _dialogFields.width,
          height: _dialogFields.height,
          child: TextFormField(
            controller: _dialogFields.controller,
            maxLength: _dialogFields.maxLength,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: _dialogFields.label,
            ),
            validator: (value) {
              final fun = _dialogFields.validator;
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
