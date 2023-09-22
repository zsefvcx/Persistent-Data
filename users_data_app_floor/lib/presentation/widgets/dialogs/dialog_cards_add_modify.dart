import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'dialog_cards_fields_controllers.dart';

class DialogCardsAddModifyBuilder extends StatefulWidget {
  const DialogCardsAddModifyBuilder({super.key,
    this.cardDetail,
  });

  final CardDetail? cardDetail;

  @override
  State<DialogCardsAddModifyBuilder> createState() => _DialogCardsAddModifyBuilderState();
}

class _DialogCardsAddModifyBuilderState extends State<DialogCardsAddModifyBuilder> {
  final _formKey = DialogCardsFieldsAndControllers.formKey;
  late CardDetail _cardDetail;

  @override
  void initState() {
    super.initState();
    _cardDetail = widget.cardDetail ?? CardDetail(
  id: null,
  firstName: '',
  name: '',
  lastName: '',
  locator: null,
  age: 18,
  phone: '',
  image: '',
  uuid: const Uuid().v4.toString(),
  );

    DialogCardsFieldsAndControllers.initControllers(data: _cardDetail);
}


  @override
  void dispose() {
    super.dispose();
    DialogCardsFieldsAndControllers.disposeControllers();
  }

  @override
  Widget build(BuildContext context) {


    bool process = false;
    return AlertDialog(
      title: const Center(child: Text('Card User')),
      content: Container(
        constraints: const BoxConstraints(maxHeight: 400),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: false,
          child: SizedBox(
            width: 300,
            height: 600,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //...DialogFieldsAndControllers.allFields.map((e) => TextFFC(dialogFields: e,)),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop((false, widget.cardDetail));
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: widget.cardDetail.id!=null?const Text('Modify'):const Text('Add'),
          onPressed: () async {
            var cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && process == false){
              if(_user.id == null){
                var (res, _) = await addOrModData(usersBloc, context);
                if (res == true) Navigator.of(context).pop();
              } else {
                process = true;
                var (res, modUser) = await addOrModData(usersBloc, context);
                process = false;
                if (res == true) Navigator.of(context).pop((res, modUser));
              }
            }
          },
        ),
      ],
    );
  }
}
